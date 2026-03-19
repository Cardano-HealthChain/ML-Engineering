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





