#!/bin/bash

echo "Installing fish shell..."
omarchy-pkg-add fish

FISH_PATH=$(which fish)

if [ -z "$FISH_PATH" ]; then
    echo "Error: fish installation failed"
    exit 1
fi

echo "Fish installed at: $FISH_PATH"

# Add fish to /etc/shells if not already present
if ! grep -q "$FISH_PATH" /etc/shells; then
    echo "Adding fish to /etc/shells..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells
fi

# Set fish as default shell for current user
echo "Setting fish as default shell for user $USER..."
sudo chsh -s "$FISH_PATH" "$USER"

echo ""
echo "Fish shell installed and set as default!"

# Install zoxide, starship and eza
echo ""
echo "Installing zoxide, starship and eza..."
omarchy-pkg-add zoxide starship eza

# Create fish config directory if it doesn't exist
mkdir -p ~/.config/fish

# Configure zoxide
echo ""
echo "Configuring zoxide..."
if ! grep -q "zoxide init" ~/.config/fish/config.fish 2>/dev/null; then
    echo "zoxide init fish | source" >> ~/.config/fish/config.fish
fi

# Configure starship
echo "Configuring starship..."
if ! grep -q "starship init" ~/.config/fish/config.fish 2>/dev/null; then
    echo "starship init fish | source" >> ~/.config/fish/config.fish
fi

# Install m function
echo "Installing m function..."
mkdir -p ~/.config/fish/functions
cp m.fish ~/.config/fish/functions/m.fish

# Configure abbreviations
echo "Configuring abbreviations..."
if ! grep -q "abbr -a ls eza" ~/.config/fish/config.fish 2>/dev/null; then
    echo "abbr -a ls eza" >> ~/.config/fish/config.fish
fi

echo "Installing Tokyo Night theme..."
fish -c "fisher install vitallium/tokyonight-fish && fish_config theme save 'TokyoNight Night'"

echo ""
echo "Please log out and log back in for the changes to take effect."
echo "Or run 'exec fish' to start using fish in the current terminal."
