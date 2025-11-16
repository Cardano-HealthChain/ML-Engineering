
# === Health AI Assistant (Gemini 2.5) ===
import google.generativeai as genai
from fastapi import FastAPI, Query
from fastapi.responses import JSONResponse
from dotenv import load_dotenv
import os

load_dotenv()

genai.configure(api_key=os.getenv("GEMINI_API_KEY"))

model = genai.GenerativeModel(
    model_name="gemini-2.5-flash",
)

SYSTEM_PROMPT = """You are a friendly, safe, non-diagnostic community health assistant."""
def build_prompt(user_query):
    return f"{SYSTEM_PROMPT}\nUser: {user_query}"

def get_gemini_response(user_query):
    prompt = build_prompt(user_query)
    response = model.generate_content(prompt)
    return response.text.strip()

app = FastAPI(title="Health AI Assistant", version="1.0")

@app.get("/")
def home():
    return {"message": " Health AI Assistant running."}

@app.get("/chat")
def chat(query: str = Query(...)):
    reply = get_gemini_response(query)
    return JSONResponse(content={"query": query, "response": reply})
