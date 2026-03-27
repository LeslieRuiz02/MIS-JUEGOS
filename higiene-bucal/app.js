// app.js

let currentStep = 1;

// Definición de las 4 etapas de limpieza
const stepsInfo = [
    {
        id: 1,
        instruction: "¡Excelente! Ahora, ponle pasta a tu cepillo.",
        animEmoji: "💦",
        percentClass: "boca-limpia-25"
    },
    {
        id: 2,
        instruction: "¡Muy bien! A cepillar esos dientitos y la lengua.",
        animEmoji: "🧴",
        percentClass: "boca-limpia-50"
    },
    {
        id: 3,
        instruction: "¡Casi listos! Enjuaga tu boquita con agua rápida.",
        animEmoji: "🪥✨",
        percentClass: "boca-limpia-75"
    },
    {
        id: 4,
        instruction: "¡Qué sonrisa tan brillante! ¡Felicidades! 🎉",
        animEmoji: "🌊",
        percentClass: "boca-limpia-100"
    }
];

function handleStep(stepNumber) {
    const btn = document.getElementById(`btn-step-${stepNumber}`);
    
    // Validar el orden secuencial
    if (stepNumber !== currentStep) {
        // Reproducir feedback de error (Shake)
        btn.classList.add('shake');
        setTimeout(() => btn.classList.remove('shake'), 400);
        return; // No avanza
    }
    
    // Paso Correcto completado
    const stepData = stepsInfo[stepNumber - 1];
    
    // 1. Actualizar el banner de instrucción con animación
    const instruction = document.getElementById('instruction-text');
    instruction.style.transform = 'scale(1.15)';
    instruction.style.color = '#388E3C'; // verde éxito temporal
    
    setTimeout(() => {
        instruction.innerText = stepData.instruction;
        instruction.style.transform = 'scale(1)';
        instruction.style.color = ''; // reset color
    }, 250);
    instruction.style.transition = 'all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275)';
    
    // 2. Ejecutar Animación visual sobre la boca
    const animLayer = document.getElementById('animation-layer');
    animLayer.innerText = stepData.animEmoji;
    animLayer.classList.remove('hidden');
    
    // Reiniciar animación en DOM
    void animLayer.offsetWidth; 
    animLayer.classList.add('show-anim');
    
    // 3. Progresivamente desaparecer la mugre aplicando la nueva clase al .mouth
    const mouth = document.querySelector('.mouth');
    // Mantenemos "mouth open" y concatenamos el nuevo nivel de limpieza
    mouth.className = `mouth open ${stepData.percentClass}`;
    
    // Limpiar animación layer después que termina
    setTimeout(() => {
        animLayer.classList.remove('show-anim');
        animLayer.classList.add('hidden');
    }, 1500);
    
    // 4. Actualizar botones: de activo a completado
    btn.classList.remove('active');
    btn.classList.add('completed');
    
    // Desbloquear siguiente paso (si existe)
    const nextBtn = document.getElementById(`btn-step-${stepNumber + 1}`);
    if (nextBtn) {
        nextBtn.classList.remove('locked');
        nextBtn.classList.add('active');
        
        // Efecto especial extra para resaltar el nuevo boton
        nextBtn.style.transform = 'scale(1.1)';
        setTimeout(() => nextBtn.style.transform = '', 300);
    }
    
    // 5. Final 🎉
    if (stepNumber === 4) {
        celebrate();
    }
    
    // Avanzar contador global
    currentStep++;
}

// Función para lanzar confeti al terminar
function celebrate() {
    const container = document.getElementById('confetti-container');
    container.classList.remove('hidden');
    
    const colors = ['#FF4081', '#00BCD4', '#8BC34A', '#FFEB3B', '#FF9800', '#9C27B0'];
    
    for (let i = 0; i < 60; i++) {
        const conf = document.createElement('div');
        conf.style.position = 'absolute';
        conf.style.width = Math.random() * 12 + 6 + 'px'; // 6px a 18px
        conf.style.height = conf.style.width;
        conf.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
        conf.style.left = Math.random() * 100 + '%';
        conf.style.top = '-10%';
        conf.style.borderRadius = (Math.random() > 0.5) ? '50%' : '2px';
        conf.style.zIndex = 100;
        
        container.appendChild(conf);
        
        // Web Animations API
        const duration = Math.random() * 2.5 + 2; // 2 a 4.5 segundos
        conf.animate([
            { transform: `translate3d(0,0,0) rotate(0deg)`, opacity: 1 },
            { transform: `translate3d(${Math.random()*200 - 100}px, 120vh, 0) rotate(${Math.random()*720}deg)`, opacity: 0 }
        ], {
            duration: duration * 1000,
            easing: 'cubic-bezier(.37, 0, .63, 1)',
            fill: 'forwards'
        });
    }
    
    // Final feliz personaje (Ojos)
    const pupils = document.querySelectorAll('.pupil');
    pupils.forEach(p => {
        p.style.height = '6px';
        p.style.borderRadius = '10px';
        p.style.transform = 'translateY(12px)';
        p.style.backgroundColor = '#1B5E20';
    });
}
