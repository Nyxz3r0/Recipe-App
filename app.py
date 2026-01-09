import streamlit as st
import requests

# Supabase credentials
SUPABASE_URL = "https://yxsupczxnkotpxfvlmmc.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl4c3VwY3p4bmtvdHB4ZnZsbW1jIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjY1MDc4MjMsImV4cCI6MjA4MjA4MzgyM30.ho4h06XiNp72RYc7WG5zVZZzR_TbbyTyy630O7vBdbA"

headers = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Prefer": "return=representation"
}

# App Title
st.title("Recipe Database Library",text_alignment="center")

# Tabs
tab1, tab2= st.tabs(["Search","Browse All"])

with tab1:
    # Simple search Bar
    search_bar = st.text_input("Find a recipe")           
    if search_bar:
        # Get recipes
        response = requests.get(
            f"{SUPABASE_URL}/rest/v1/recipes?select=*",
            headers=headers)

        if response.status_code == 200:
            recipes = response.json()

            # Filter by search
            recipes = [r for r in recipes if search_bar.lower() in r['rec_name'].lower()]

            # Display results
            if recipes:
                for recipe in recipes:
                        with st.expander(f"{recipe['rec_name']} - Difficulty: {recipe['rec_difficulty']}/5 | Cook time: {recipe['rec_cook']} min"):
                            # Create two columns for image and info
                            col1, col2 = st.columns([1, 1])

                            # Recipe Image
                            with col1:
                                if recipe.get('rec_image'):
                                    st.image(recipe['rec_image'], width=500)
                            #Recipe Overview
                            with col2:
                                st.write(f"**Type:** {recipe['rec_type']}")
                                st.write(f"**Prep time:** {recipe['rec_prep']} min")
                                st.write(f"**Cook time:** {recipe['rec_cook']} min")
                                st.write(f"**Servings:** {recipe['rec_servings']}")
                                st.write(f"**Difficulty:** {recipe['rec_difficulty']}/5")
                            # Recipe Instructions    
                            st.write("**Instructions:**")
                            st.text(recipe['rec_instructions'])
            else:
                st.info("No recipes found matching your search.")
    else:
        st.info("Enter a recipe name above to search.")


with tab2:
    # Get all recipes
    response = requests.get(
        f"{SUPABASE_URL}/rest/v1/recipes?select=*",
        headers=headers
    )

    if response.status_code == 200:
        recipes = response.json()

        st.write(f"Showing {len(recipes)} recipe(s)")

        for recipe in recipes:
            st.header(recipe['rec_name'])

            # Create two columns
            col1, col2 = st.columns([1, 10])
            
            # Recipe Image
            with col1:
                if recipe.get('rec_image'):
                    st.image(recipe['rec_image'], width=500)

            # Recipe Overview
            with col2:
                st.write(f"**Type:** {recipe['rec_type']}")
                st.write(f"**Prep time:** {recipe['rec_prep']} min")
                st.write(f"**Cook time:** {recipe['rec_cook']} min")
                st.write(f"**Servings:** {recipe['rec_servings']}")
                st.write(f"**Difficulty:** {recipe['rec_difficulty']}/5")
            
            # Instructions
            st.write("**Instructions:**")
            st.text(recipe['rec_instructions'])

            st.divider()
    else:
        st.error("Failed to load recipes")
