echo "🚀 Démarrage de l'environnement de développement CodeTalk..."

# Vérification des ports pour éviter les conflits
PORTS=(5000 3000 8080 19000)
NOMS=("Backend" "Frontend" "Desktop" "Mobile")

for i in "${!PORTS[@]}"
do
    if lsof -Pi :${PORTS[$i]} -sTCP:LISTEN -t >/dev/null ; then
        echo "❌ Le port ${PORTS[$i]} (${NOMS[$i]}) est déjà utilisé !"
        exit 1
    fi
done

# Démarrage des services en parallèle
echo "📦 Démarrage du backend..."
cd backend && npm run dev &

echo "🖥️  Démarrage du frontend (React)..."
cd ../Frontend/WEB && npm start &

echo "💻 Démarrage de l'application desktop (Electron + React)..."
cd ../Desktop && npm start &

echo "📱 Démarrage de l'application mobile (React Native)..."
cd ../Mobile && npx react-native start &

echo "⏱️ Démarrage de cron..."
cd ../../Cron && npm run dev &

echo "✅ Tout est lancé ! 🌟"
echo "Utilise './stop-dev.sh' pour tout arrêter proprement."