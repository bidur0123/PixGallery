# PixGallery

PixGallery is a Flutter web app application that displays a gallery of images sourced from the Pixabay API. The app allows users to browse images. The app is built with Flutter, using GetX for state management, and deployed on GitHub Pages.

## Features
- Fetch images from Pixabay API
- Dynamically fetch the images
- Shows number of Likes , Views and UploadedBy
- Responsive design for both desktop and mobile views

## Live Demo
Check out the live demo [here](https://bidur0123.github.io/PixGallery/).

## Installation

To run this project locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/bidur0123/PixGallery.git

2. Install dependencies:
   ```bash
   flutter pub get
   
3. run the app:
   ```bash
   flutter run

## Deployment
- This app is deployed to GitHub Pages using a GitHub Actions CI pipeline. The deployment is triggered automatically on a push to the main branch.

## Configuration
-The app uses a config.json file to store the Pixabay API key. During the GitHub Actions deployment, this file is generated dynamically using the API key stored as a secret in the repository.

## To set up:

- Add the Pixabay API key as a GitHub secret named PIXABAY_API_KEY.
- The workflow will create the config.json file in the assets/ directory and handle the deployment.

## Technologies Used
- Flutter
- GetX for state management
- `http` package for fetching images from the API
- GitHub Actions for CI/CD
- GitHub Pages for deployment

