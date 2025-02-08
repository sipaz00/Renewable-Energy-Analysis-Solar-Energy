import streamlit as st
import pandas as pd

############################ PAGE SETUP ############################
# Set up the page
st.set_page_config(
    page_title="Renewable Energy Dashboard",
    layout="centered", 
    page_icon="🔋", 
    initial_sidebar_state="collapsed" # or expanded
)

# data load
df_c = pd.read_csv('country_df.csv')
df_r = pd.read_csv('region_df.csv')

# Title
st.title("Renewable Energy")
st.divider() #adds a line

#Subheader
st.subheader("EV Sales by Region")

#filters
region = df_r['region'].unique()
selected_region = st.selectbox('Select Region', region)
filtered_df = df_r[df_r['region'] == selected_region]

#Bar chart with filtered data
st.bar_chart(filtered_df, x='re_share_of_electricity_capacity_and_generation_%', y='year', color='powertrain')