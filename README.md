# HealthChain: AI Health Assistant

This is a dedicated microservice that powers the "HealthChain Assistant" AI chatbot.

Its sole responsibility is to receive a chat query from the `api-service`, process it securely, and return a helpful, grounded response. It is designed to act as a community health guide, *not* a diagnostic tool.

➡️ **View the main organization page:** [Link to your GitHub Org]

---

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

### Getting Started

1.  **Clone the repository:**
    ```bash
    git clone [repository-url]
    cd ml-assistant
    ```

2.  **Install dependencies:**
    ```bash
    npm install
    ```

3.  **Set up environment variables:**
    Create a `.env` file in the root and add your API key:
    ```
    # Service port
    PORT=3002

    # Google AI API Key
    GEMINI_API_KEY=...
    ```

4.  **Run the development server:**
    ```bash
    npm run dev
    ```
