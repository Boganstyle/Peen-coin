// src/components/Countdown.jsx
import { useEffect, useState } from "react";

const Countdown = () => {
  const launchDate = new Date("2025-10-01T00:00:00+13:00").getTime(); // NZDT (UTC+13)
  const [timeLeft, setTimeLeft] = useState(launchDate - Date.now());

  useEffect(() => {
    const timer = setInterval(() => {
      setTimeLeft(launchDate - Date.now());
    }, 1000);
    return () => clearInterval(timer);
  }, [launchDate]);

  const formatTime = (ms) => {
    const totalSeconds = Math.floor(ms / 1000);
    const days = Math.floor(totalSeconds / 86400);
    const hours = Math.floor((totalSeconds % 86400) / 3600);
    const minutes = Math.floor((totalSeconds % 3600) / 60);
    const seconds = totalSeconds % 60;
    return `${days}d ${hours}h ${minutes}m ${seconds}s`;
  };

  return (
    <div className="text-center text-xl font-bold text-white bg-purple-800 rounded-lg p-4 my-6 animate-pulse">
      🎉 Peen-coin launches in: {formatTime(timeLeft)}
    </div>
  );
};

export default Countdown;


// src/pages/Home.jsx (insert inside return block of the component, above footer or below main hero)
import Countdown from "../components/Countdown";

...
<main className="text-center">
  ...
  <Countdown />
  <section className="text-white text-lg mt-8">
    <p>Peen-coin is the meme revolution for 2025.</p>
    <p className="mt-2">We're partnered with Ween-coin and Scene-coin to take over the meme-verse.</p>
  </section>
  ...
</main>


// Also ensure src/App.jsx is importing Home correctly and rendering it inside Routes
