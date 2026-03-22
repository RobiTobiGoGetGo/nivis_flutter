# Nivis Flutter Deployment Script
$VERSION = "1.0.0+1"
$REPO_NAME = "nivis_flutter"
$USER_NAME = "RobiTobiGoGetGo"

Write-Host "CLEANING AND BUILDING v$VERSION..." -ForegroundColor Yellow
flutter clean
flutter pub get
flutter build web --base-href "/$REPO_NAME/" --release

if ($LASTEXITCODE -ne 0) {
    Write-Host "BUILD FAILED!" -ForegroundColor Red
    exit
}

# Define build directory
$BUILD_DIR = "build/web"

if (-not (Test-Path $BUILD_DIR)) {
    Write-Host "Build directory not found!" -ForegroundColor Red
    exit
}

Write-Host "PREPARING DEPLOYMENT..." -ForegroundColor Yellow
Push-Location $BUILD_DIR

git init
git add .
git commit -m "Auto-Release v$VERSION"

Write-Host "PUSHING TO GITHUB..." -ForegroundColor Yellow
git remote add origin "https://github.com/$USER_NAME/$REPO_NAME.git"
git push origin master:gh-pages --force

Pop-Location

if ($LASTEXITCODE -ne 0) {
    Write-Host "PUSH FAILED!" -ForegroundColor Red
    exit
}

Write-Host "SUCCESS! v$VERSION is now on GitHub Pages." -ForegroundColor Green
Write-Host "URL: https://$USER_NAME.github.io/$REPO_NAME/" -ForegroundColor Cyan
