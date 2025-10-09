# Introduuction to Flutter

Flutter is a cross platoform, open source sotware development kit (sdk) that helps creating high performance natively comiled apps for mobile, web and desktop in a single codebase.

## Flutter Architecture 

  - **Flutter Framework**: Built using the Dart programming language, Flutter is centered around a widget-based architecture. In Flutter, everything is a widget, from basic UI elements like buttons to entire screens. These widgets are highly customizable and reusable, allowing developers to efficiently build consistent user interfaces across platforms.
  - **Rendering Engine**: Flutter uses Impeller rendering engine. Impeller precompiles a smaller, simpler set of shaders at Engine-build time so they don't compile at runtime.

## Widgets

Widgets are the building block of an app. Flutter uses a widget tree to determine how widgets are arranged and displayed. Widgets are lightweight and designed to be reusable.

  - **Stateless Widgets** - These are immutable (unchangeable) widgets i.e. their state does not change.
  - **Statefull Widgets** = These are mutable widgets.

## Installing Flutter SDK
  ### For Windows

   - Download Flutter SDK:
      Visit Flutter SDK.
      Download the .zip file for Windows.
   
  - Extract the Flutter SDK:
      Extract the downloaded .zip file to C:\src\flutter.

  - Add Flutter to System PATH:
      - Open System Properties:
        Press Win + Pause.
        Click Advanced system settings > Environment Variables.
      - Edit the Path variable under System Variables:
        Add the path to the flutter\bin directory. Example:
            `C:\src\flutter\bin`
        Save and close.
  
  - Verify Installation:
      - Open Command Prompt and run:
          `flutter doctor/ flutter --version`

Follow instructions to resolve any missing dependencies.

## Creating a Flutter App

  1. Open Your IDE: Start by launching Visual Studio Code.
  2. Navigate to your directory and open it.
  3. Open a terminal or command prompt.
  4. Create a new Flutter project using the flutter create command:
      `flutter create your_project_name`
  5. To run the app type `flutter run` in the command prompt.
