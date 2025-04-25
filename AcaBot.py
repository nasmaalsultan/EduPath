from fastapi import FastAPI
from pydantic import BaseModel
from groq import Groq
from fastapi.middleware.cors import CORSMiddleware

client = Groq(api_key="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")

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class ChatRequest(BaseModel):
    message: str

@app.post("/chatbot")
def chatbot(request: ChatRequest):
    completion = client.chat.completions.create(
        messages=[
            {"role": "user", "content": request.message},
            {"role": "system", "content": """
            Act as a chatbot for our app EduPath that is a an app that personalises university applications 
                                       and helps students navigate a smooth and hassle free application journey. EduPath is a mobile app 
                                       that streamlines and personalises the university application process. It helps students find the right 
                                       unis and shortlist them, find scholarships, ECAs, and more — all through AI-powered features and personalised 
                                       suggestions.
                                       Key features include: AI Chatbot for Tutoring (AcaBot), Topical academic tutoring based on user’s input 
                                       and needs, ECA Suggestions and tracking, Generates meaningful, non-generic extracurriculars. Tailored lists for:
                                       US, UK, Canada, and the rest of the world. Smart filters for budget, proximity, campus type, world ranking, and 
                                       acceptance rate. Scholarship Matchmaking that has scholarship recommendations, Filters by location, eligibility, 
                                       and deadlines, personal Statements, Common App, and other essays. Essay structuring tips and brainstorming prompts.
                                       AI-powered feedback without compromising originality
                                       Keep answers short but informative, be kind. Try not to ask anything that needs
                                       storing because we don't have anywhere to store it. Don't ask anything personal and remain professional at all times. KEEP ANSWERS SHORT"""}
        ],
        model="llama3-8b-8192"
    )
    return {"response": completion.choices[0].message.content}

from fastapi import FastAPI, Request
from groq import Groq
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

client = Groq(api_key="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")

@app.post("/chat")
async def chat_endpoint(request: Request):
    data = await request.json()
    user_input = data.get("message", "")

    chat_completion = client.chat.completions.create(
        messages=[
            {"role": "user", "content": user_input},
            {
                "role": "system",
                "content": """
            Keeping answerts short but informative and staying professional, act as a chatbot for our app EduPath that 
            is a an app that personalises university applications and helps students navigate a smooth and hassle free application 
            journey. It helps students find the right universitiess and shortlist them, find scholarships, ECAs, and more through 
            AI-powered features. Key features include: AI Chatbot for Tutoring (AcaBot), Topical academic tutoring based on user’s input 
            and needs, ECA Suggestions and tracking, Generates meaningful, non-generic extracurriculars, Tailored lists for:
            US, UK, Canada, and the rest of the world, Smart filters for budget, proximity, campus type, world ranking, and 
            acceptance rate, Scholarship Matchmaking that has scholarship recommendations, Filters by location, eligibility, 
            and deadlines, personal Statements, Common App, and other essays, Essay structuring tips and brainstorming prompts, AI-powered 
            feedback without compromising originality.
            Be kind. Try not to ask anything that needs storing. Don't ask anything personal and remain professional at all times.""",
            },
        ],
        model="llama3-8b-8192",
    )

    response = chat_completion.choices[0].message.content
    return {"reply": response}


