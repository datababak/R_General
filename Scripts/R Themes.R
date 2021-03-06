#### Preamble ####
# Purpose: Change R Studio theme
# Author: Babak Mokri
# Data: 4 January 2021
# Contact: b.mokri@mail.utoronto.ca
# License: MIT;
# Reference: https://www.garrickadenbuie.com/project/rsthemes/#installation

#### Installation ####
#You can install rsthemes from GitHub with:
  
# install.packages("devtools")
devtools::install_github("gadenbuie/rsthemes")

# Then, install the included, hand-crafted themes with:
rsthemes::install_rsthemes()

#or you can install the themes plus an additional set of base16-based themes with
rsthemes::install_rsthemes(include_base16 = TRUE)


#### Usage ####
#The rsthemes package includes a couple helper functions for exploring the themes.

# list installed themes
rsthemes::list_rsthemes()

# Try all themes
rsthemes::try_rsthemes()

# Try just the light, dark, or base16 themes, e.g.
rsthemes::try_rsthemes("light")

# Use rstudioapi::applyTheme() #to activate a theme from the R console, or use Tools > Global Options > Appearance to interactively select a theme.

# Use a theme
rstudioapi::applyTheme("One Dark {rsthemes}")


#### Easy Theme Switching ####
#rsthemes includes RStudio addins and functions to…

# 🌅 Toggle Dark Mode
# Switch between two preferred dark and light themes

# 🌃 Auto Dark Mode
# Automatically choose a dark or light theme by time of day

# ❤️ Favorite Themes
# Switch between a few of your favorite themes

#### Choose Your Preferred Themes ####

## First, set a default light and dark theme. For your current R sessions, you can use the Set Default Light Theme to Current addin (or the corresponding dark theme addin), or you can call the set_theme_light() or set_theme_dark() functions:
  
# Set current theme to default light or dark theme
rsthemes::set_theme_light()
rsthemes::set_theme_dark()

# Set a specific theme to default light or dark theme
rsthemes::set_theme_light("One Light {rsthemes}")
rsthemes::set_theme_dark("One Dark {rsthemes}")

## To create a list of your favorite themes, you can use set_theme_favorite().

# Add current theme to your list of favorites
rsthemes::set_theme_favorite()

# Add a list of themes to your favorites
rsthemes::set_theme_favorite(
  c("GitHub {rsthemes}", "One Light {rsthemes}", "One Dark {rsthemes}")
)

## These functions only save your preferences for the current R session. To set these defaults for all R sessions, add your preferences to your ~/.Rprofile. (You can use usethis::edit_r_profile() to quickly open your ~/.Rprofile for editing.)

# ~/.Rprofile
if (interactive()) {
  rsthemes::set_theme_light("GitHub {rsthemes}")
  rsthemes::set_theme_dark("Fairyfloss {rsthemes}")
  rsthemes::set_theme_favorite(
    c("GitHub {rsthemes}", 
      "One Light {rsthemes}", 
      "One Dark {rsthemes}")
  )
}

## You can also set the following global options directly.

# ~/.Rprofile
options(
  rsthemes.theme_light = "Nord Snow Storm {rsthemes}",
  rsthemes.theme_dark = "Nord Polar Night Aurora {rsthemes}",
  rsthemes.theme_favorite = paste("One", c("Light", "Dark"), "{rsthemes}")
)


#### Toggle Your Favorite Themes ####

# Use the Next Favorite Theme addin to walk through your list of favorite themes. Use the Modify Keyboard Shortcuts… dialog in the Tools menu of RStudio to create a keyboard shortcut to make it easy to quickly switch themes — I use Ctrl+ Alt + N. You can also manually call use_theme_favorite() to use the next theme in the your favorites list.

# Each time you run the addin, RStudio switches to the next theme in your favorites list. This is great if you have a few themes that you use in various contexts. For example, I have my personal favorite themes plus a few themes that work well during class or presentation sessions.

#### Automatic or Manual Light/Dark Mode ####

# Use the Toggle Dark Mode addin to switch between your default light and dark themes. You can even set a keyboard shortcut in RStudio — I used Ctrl + Alt + D — to toggle dark mode.

# You can also automatically choose the dark or light theme by time of day, using the included Auto Choose Dark or Light Theme addin, which requires that you’ve set your preferred light/dark themes (see above).

# If you would like to automatically choose the dark or light theme by time of day during each new session, you can call rsthemes::use_theme_auto() in your ~/.Rprofile. For best results, use the following template in your ~/.Rprofile to declare your preferred dark and light themes and to choose the correct style when your R session reloads.

if (interactive() && requireNamespace("rsthemes", quietly = TRUE)) {
  # Set preferred themes if not handled elsewhere..
  rsthemes::set_theme_light("One Light {rsthemes}")  # light theme
  rsthemes::set_theme_dark("One Dark {rsthemes}") # dark theme
  
  # Whenever the R session restarts inside RStudio...
  setHook("rstudio.sessionInit", function(isNewSession) {
    # Automatically choose the correct theme based on time of day
    rsthemes::use_theme_auto(dark_start = "18:00", dark_end = "6:00")
  }, action = "append")
}


#### Uninstall ####

## If you want to uninstall all or some of the themes, you can use

rsthemes::remove_rsthemes()

# or just the base16 themes, e.g.
rsthemes::remove_rsthemes("base16")

