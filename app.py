import streamlit as st
import requests

# Supabase credentials
SUPABASE_URL = "https://yxsupczxnkotpxfvlmmc.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl4c3VwY3p4bmtvdHB4ZnZsbW1jIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjY1MDc4MjMsImV4cCI6MjA4MjA4MzgyM30.ho4h06XiNp72RYc7WG5zVZZzR_TbbyTyy630O7vBdbA"

headers = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}"
}

# Streamlit app
st.title("My Recipe Manager")

# Get recipes
response = requests.get(
    f"{SUPABASE_URL}/rest/v1/recipes?select=*",
    headers=headers
)

if response.status_code == 200:
    recipes = response.json()
    
    for recipe in recipes:
        st.header(recipe['rec_name'])
        st.write(f"**Type:** {recipe['rec_type']}")
        st.write(f"**Prep time:** {recipe['rec_prep']} min | **Cook time:** {recipe['rec_cook']} min")
        st.write(f"**Servings:** {recipe['rec_servings']} | **Difficulty:** {recipe['rec_difficulty']}/5")
        st.write("**Instructions:**")
        st.text(recipe['rec_instructions'])
        st.divider()
else:
    st.error("Failed to load recipes")
