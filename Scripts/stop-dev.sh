cho "🛑 Arrêt de CodeTalk..."

# Trouver et tuer tous les processus liés à Node.js
pids=$(ps aux | grep node | grep -v grep | awk '{print $2}')

if [ -z "$pids" ]; then
    echo "✅ Aucun processus Node.js en cours d'exécution."
else
    echo "🛑 Arrêt des processus Node.js..."
    kill -9 $pids
    echo "✅ Tous les processus Node.js ont été arrêtés."
fi

echo "🌟 CodeTalk est maintenant arrêté."