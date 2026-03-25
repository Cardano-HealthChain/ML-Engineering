# HealthChain: AI Health Assistant

This is a dedicated microservice that powers the "HealthChain Assistant" AI chatbot.

Its sole responsibility is to receive a chat query from the `api-service`, process it securely, and return a helpful, grounded response. It is designed to act as a community health guide, *not* a diagnostic tool.

### Technology Stack

* **Framework:** Node.js (or Python/Flask)
* **Language:** TypeScript
* **AI:** Google Gemini API (specifically `gemini-2.5flash--preview-09-2025` as per MVP)
* **Grounding:** Google Search (enabled via `tools`)

### Core MVP Logic

* **(ML-1.1) Chat Service:** An API endpoint that receives user input from the `api-service`.
* **(ML-1.2) System Instruction:** A static system prompt that defines the model's persona as a friendly, non-diagnostic community health assistant.
* **(ML-1.3) Search Grounding:** All external knowledge queries (e.g., "What are malaria symptoms?") *must* be grounded using the Google Search tool.
* **(ML-1.4) Contextual Prompting:** Logic to prepend context to a user's query (e.g., "User is asking about a 'Vaccination Drive' alert they just received").
* **(ML-1.5) Response & Citation Handling:** Parses the Gemini response and extracts all citation sources to be displayed in the frontend.

# Health Assistant Chatbot (Gemini 2.5)

A friendly, non-diagnostic community health assistant built using **Google Gemini 2.5** Generative AI API.  
This project exposes a **FastAPI** backend for easy integration with frontend applications.

---

## Features

- **Human-like responses:** Provides clear, educational, and safe health information.
- **Contextual prompting:** Includes context in queries to generate accurate responses.
- **Citation handling:** Extracts sources and links for information provided.
- **Rule-based triage:** Handles basic symptom detection and alerts locally.
- **API-powered retrieval:** Uses Gemini 2.5 model instead of local datasets.
- **FastAPI endpoints:** Easy integration with frontend or other backend services.

##  Requirements

- Python 3.10+
- FastAPI
- Uvicorn
- Requests
- (Optional) pyngrok and nest_asyncio for testing in Google Colab



# Personalized Health Insights API

## Overview
This project is a backend service that generates personalized health insights from user lifestyle data. It uses Google Gemini 2.5 Flash to return safe, non diagnostic guidance.

The system accepts structured inputs such as age, sleep, hydration, exercise, and symptoms. It then produces clear insights and simple improvement tips.

This is Phase 2 of a larger health intelligence system.

---

## Features

- Personalized health insights based on user data  
- Safe, non diagnostic responses  
- Structured API endpoint for backend integration  
- Secure API key handling using environment variables  
- Ready for deployment and team integration  

## Tech Stack

- Python  
- FastAPI  
- Google Gemini API  
- Requests  
- Python Dotenv  

---

## Project Structure

health-insights/
│
├── app.py
├── .env
├── .gitignore
├── requirements.txt
└── README.md



## How It Works

1. The user sends health data to the API  
2. The backend formats the data into a structured prompt  
3. The prompt is sent to Gemini 2.5 Flash  
4. The AI generates personalized insights  
5. The API returns the response in JSON format  



## API Endpoint

### POST /insights

#### Request Body

```json
{
  "age": 25,
  "gender": "male",
  "sleep_hours": 5,
  "water_intake": "low",
  "exercise_per_week": 1,
  "symptoms": "frequent headaches"
}

## Security

- API key is stored in `.env`  
- `.env` is excluded using `.gitignore`  
- No secrets are exposed in code  

---

## Use Cases

- Health tracking applications  
- Fitness and wellness platforms  
- Telehealth support systems  
- Preventive healthcare tools  



## Limitations

- Does not provide medical diagnosis  
- Relies on user input accuracy  
- Requires internet connection for API calls  



## Future Improvements

- Automated health alerts  
- Health prediction engine using ML  
- User history tracking  
- Integration with wearable devices  



## Team Integration

Backend developers can call the API using:POST /insights


#  Automated Health Alerts API

A simple and intelligent API that analyzes user lifestyle data and generates **automated health alerts** using rule-based logic, optionally enhanced with AI for more natural and human-friendly responses.

---

##  Project Overview

The **Automated Health Alerts API** helps detect unhealthy patterns in a user’s daily habits such as:

* Poor sleep
* Low water intake
* Lack of physical activity

It then generates alerts to guide users toward healthier behavior.

This system is designed to be:

*  Fast (rule-based logic)
*  Scalable (API-ready)
*  User-friendly (AI-enhanced responses)

---

##  Features

*  Detects unhealthy lifestyle patterns
*  Rule-based alert generation
*  Optional AI enhancement using Gemini API
*  Secure API key handling with `.env`
*  REST API built with FastAPI

---

##  Project Structure

```
project-folder/
│
├── app.py              # Main application file
├── .env                # Stores API key (not pushed to GitHub)
├── .gitignore          # Prevents sensitive files from uploading
└── requirements.txt    # Project dependencies
```

---

##  Environment Variables

Create a `.env` file in your root directory:

```
GEMINI_API_KEY=your_api_key_here
```

##  Installation

Install dependencies:

```bash
pip install -r requirements.txt
```

Or manually:

```bash
pip install fastapi uvicorn requests python-dotenv pydantic
```

---

##  Running the Application

Start the server:

```bash
uvicorn app:app --reload
```

Server will run at:

```
http://127.0.0.1:8000
```

---

##  API Endpoint

###  Check Health Alerts

**POST** `/alerts/check`

#### Request Body (JSON)

```json
{
  "sleep_hours": 4,
  "water_intake": "low",
  "exercise_per_week": 1
}
```

#### Response Example

```json
{
  "status": "success",
  "alerts": [
    "You're not getting enough sleep. Try to rest more.",
    "Your water intake is low. Stay hydrated.",
    "You may need more physical activity during the week."
  ]
}
```

---

##  How It Works

### 1. Rule-Based Detection

The system checks:

* Sleep < 5 hours → Low sleep alert
* Water intake = "low" → Hydration alert
* Exercise < 2 times/week → Activity alert

### 2. AI Enhancement (Optional)

Alerts are passed to the Gemini API to:

* Improve tone
* Make responses more natural
* Keep them safe and non-diagnostic

---

##  Testing Without Server

You can test directly in Python:

```python
class Dummy:
    sleep_hours = 4
    water_intake = "low"
    exercise_per_week = 0

print(improve_alerts_with_ai(generate_alerts(Dummy)))
```

---

##  Security Best Practices

* Store API keys in `.env`
* Add `.env` to `.gitignore`
* Never expose API keys in public repositories

---

##  Dependencies

* FastAPI
* Uvicorn
* Requests
* Python-dotenv
* Pydantic

---

##  Use Cases

* Health tracking apps
* Fitness platforms
* Preventive healthcare systems
* Wellness dashboards

##  Future Improvements

* Real-time notifications (SMS / Email)
* Integration with wearable devices
* Advanced health scoring system
* User history tracking


#  ML Health Prediction Engine API

A machine learning-powered API that predicts a user's health risk level based on lifestyle data, enhanced with AI-generated explanations using the Gemini API.


##  Project Overview

The **ML Health Prediction Engine** analyzes user health inputs such as sleep, hydration, exercise, and symptoms to predict a **health risk level**:

-  Low Risk  
-  Moderate Risk  
-  High Risk  

This system combines:
-  Machine Learning (scikit-learn)
-  FastAPI (for API endpoints)
-  Gemini AI (for human-friendly explanations)
-  Secure API key handling using `.env`

##  Features

-  Real ML model using `RandomForestClassifier`
-  Risk prediction based on lifestyle data
-  AI-generated explanations using Gemini API
-  Secure API key management with `.env`
-  REST API built with FastAPI
-  Model saving using `joblib`
-  Ready for future retraining with real user data

How It Works
1. Data Preprocessing

User input is converted into numerical format:

Water intake → encoded (low=0, medium=1, high=2)
Symptoms → binary (yes=1, no=0)
2. Machine Learning Model

A Random Forest Classifier is trained on structured data:

Inputs:
Sleep hours
Water intake
Exercise frequency
Symptoms
Output:
Risk level (0 = Low,








