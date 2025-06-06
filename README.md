# Nour-App: Mobile Support for PTSD Patients

**Nour-App** is a mobile application designed to support patients with Post-Traumatic Stress Disorder (PTSD). It offers features to promote mental well-being, including a *Hope Box* for personal positive content, meditation videos, and a quiz to assess patient improvement using a clinically recognized scoring technique.



## Features

* **Hope Box:** Users can upload and store photos, notes, and other items that bring them hope and positivity, inspired by popular American mental health apps.
* **Meditation Videos:** A curated collection of meditation and relaxation videos to help users manage stress and anxiety.
* **Improvement Quiz:** A questionnaire with scoring to track emotional and psychological progress over time.
* **Cross-platform Support:** Available on Android, iOS, Web, and desktop platforms.



## Repository Structure

```
.
├── Backend/
├── android/
├── ios/
├── lib/
├── Hope Box/
├── Calm Screen/
├── Update Quiz/
├── Sign Up/
├── assets/
├── test/
├── web/
├── windows/
├── macos/
└── linux/
```


## Technologies

* **Flutter:** Cross-platform UI development
* **Python Flask:** Backend API server
* **Dart:** Application logic
* **MySQL:** For storing user data and Hope Box content



## Getting Started

### Prerequisites

* Flutter SDK installed
* Python 3.x environment for backend
* Android Studio / Xcode (for mobile builds)

### Installation

1. Clone the repo:

   ```bash
   git clone https://github.com/SaraElwatany/Nour-App.git
   cd Nour-App
   ```

2. Install backend dependencies:

   ```bash
   pip install -r requirements.txt
   ```

3. Run the backend server:

   ```bash
   python run.py
   ```

4. Setup Flutter app:

   ```bash
   flutter pub get
   flutter run
   ```



## Usage

* Open the app on your device/emulator.
* Sign up or log in.
* Use the **Hope Box** to add or view positive content.
* Access meditation videos from the **Calm Screen**.
* Take the quiz regularly to monitor progress.



## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve the app.
