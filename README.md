# MyGarage – AI Powered Smart Parking System

MyGarage is a university-based AI parking system that uses machine learning and sensors to automate parking spot management, detect license plates, and control access to parking gates.

## Summary

Parking on university campuses is normally slow, manual, and frustrating. MyGarage improves the process by using AI (YOLOv8 + OCR) and Arduino hardware to detect cars, read plate numbers, and open gates automatically.

The goal is to make parking faster, smarter, reduce errors, and improve student/employee experience.

---

## System Components

### Hardware
- Arduino Uno R3
- Ultrasonic Sensors
- 9g Servo Motor (gate opening)
- Breadboard + Wires

### Software
- Python (YOLOv8 for plate detection)
- EasyOCR (plate text recognition)
- OpenCV (image processing)
- Flutter (Mobile UI)
- SQLite (Local DB)
- Roboflow (Dataset Annotation)

---

## Data & Model

- >2000 images collected from different angles
- YOLOv8 detects the car plate and plate ID
- Recognition accuracy: 54% – 71.5%
- Detection success rate: 96.5%

---

## Results

The system automatically:
1) Detects car approaching
2) Detects plate area
3) Reads plate ID & number
4) Can open gate automatically (servo motor)

---

## Future Work

- Add backend CRUD API
- Improve OCR recognition accuracy
- Upgrade sensors + wiring
- Handle more students/employees at scale
- Privacy & data protection enhancements

---

## Team

- Yara Hakij
- Lana Abdulhaq
- Anas Salman

**Supervisor:** Prof. Mohammad I. Daoud  
B.Sc. Computer Engineering – German Jordanian University, 2024
