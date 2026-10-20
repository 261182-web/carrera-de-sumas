<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="theme-color" content="#38bdf8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-mobile-web-app-title" content="Carrera de Sumas">
<meta name="format-detection" content="telephone=no">
<meta name="mobile-web-app-capable" content="yes">
<style>
  html, body { -webkit-text-size-adjust: 100%; touch-action: manipulation; }
  button, .mode-btn, .btn { -webkit-appearance: none; appearance: none; cursor: pointer; }
  input#ans { -webkit-appearance: none; appearance: none; font-size: 24px !important; }
  @media screen and (max-width: 500px) {
    input#ans { font-size: 16px !important; }
  }
</style>
<link rel="manifest" href="manifest.webmanifest">
<link rel="apple-touch-icon" href="icon-192.svg">
<link rel="icon" href="icon-192.svg" type="image/svg+xml">
<link rel="icon" href="icon-512.svg" type="image/svg+xml" sizes="any">
<title>Carrera de Sumas 🏁</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;600;700&family=Nunito:wght@700;800;900&display=swap');
:root{--sky:#7dd3fc;--sky2:#38bdf8;--grass:#4ade80;--grass2:#22c55e;--sun:#fde047;--red:#f87171;--blue:#60a5fa;--pink:#f9a8d4;--purple:#c4b5fd;--orange:#fb923c;--white:#fff;--dark:#1e3a5f}
*{box-sizing:border-box;margin:0;padding:0;font-family:'Fredoka','Nunito',system-ui,sans-serif}
body{background:linear-gradient(180deg,#7dd3fc 0%,#bae6fd 40%,#86efac 100%);min-height:100vh;display:flex;flex-direction:column;align-items:center;overflow-x:hidden;position:relative}

/* Nubes globales del juego */
.cloud{position:fixed;background:#fff;border-radius:50px;opacity:.85;z-index:0;pointer-events:none}
.cloud::before,.cloud::after{content:'';position:absolute;background:#fff;border-radius:50%}
.cloud1{width:120px;height:40px;top:8%;left:5%;animation:drift 25s linear infinite}
.cloud1::before{width:50px;height:50px;top:-25px;left:15px}
.cloud1::after{width:60px;height:60px;top:-30px;left:45px}
.cloud2{width:90px;height:30px;top:18%;right:8%;animation:drift 32s linear infinite reverse}
.cloud2::before{width:40px;height:40px;top:-20px;left:10px}
.cloud2::after{width:45px;height:45px;top:-22px;left:35px}
.cloud3{width:100px;height:35px;top:5%;left:55%;animation:drift 28s linear infinite}
.cloud3::before{width:45px;height:45px;top:-22px;left:12px}
.cloud3::after{width:50px;height:50px;top:-25px;left:40px}
@keyframes drift{0%{transform:translateX(0)}50%{transform:translateX(40px)}100%{transform:translateX(0)}}

/* ========== 1. PANTALLA DE CARGA ========== */
#loader{
  position:fixed;inset:0;z-index:300;
  display:flex;flex-direction:column;align-items:center;justify-content:center;
  background:linear-gradient(160deg,#38bdf8 0%,#7dd3fc 40%,#a5f3fc 70%,#86efac 100%);
  transition:opacity .7s ease,visibility .7s;overflow:hidden;
}
#loader.hide{opacity:0;visibility:hidden;pointer-events:none}
.loader-bg-sun{
  position:absolute;top:12%;right:12%;width:100px;height:100px;
  background:radial-gradient(circle,#fde047 40%,#facc15 100%);border-radius:50%;
  box-shadow:0 0 50px #fde047,0 0 100px rgba(253,224,71,.4);
  animation:loaderSunPulse 2.5s ease-in-out infinite;
}
@keyframes loaderSunPulse{0%,100%{transform:scale(1)}50%{transform:scale(1.12)}}
.loader-cloud{position:absolute;background:#fff;border-radius:50px;opacity:.85;animation:loaderCloudMove 8s ease-in-out infinite}
.loader-cloud::before,.loader-cloud::after{content:'';position:absolute;background:#fff;border-radius:50%}
.lc1{width:130px;height:42px;top:18%;left:-20%;animation-duration:10s}
.lc1::before{width:50px;height:50px;top:-25px;left:15px}.lc1::after{width:60px;height:55px;top:-30px;left:48px}
.lc2{width:100px;height:34px;top:30%;right:-15%;animation-duration:12s;animation-direction:reverse}
.lc2::before{width:42px;height:42px;top:-20px;left:10px}.lc2::after{width:50px;height:48px;top:-24px;left:40px}
.lc3{width:80px;height:28px;top:10%;left:40%;animation-duration:9s;opacity:.7}
.lc3::before{width:35px;height:35px;top:-18px;left:8px}.lc3::after{width:42px;height:40px;top:-20px;left:30px}
@keyframes loaderCloudMove{0%{transform:translateX(0)}100%{transform:translateX(120vw)}}
.loader-content{z-index:5;text-align:center;animation:loaderContentIn 1s ease both}
@keyframes loaderContentIn{from{opacity:0;transform:scale(.7) translateY(30px)}to{opacity:1;transform:scale(1) translateY(0)}}
.loader-logo{font-size:clamp(42px,12vw,72px);font-weight:800;letter-spacing:2px;line-height:1.1;margin-bottom:8px}
.loader-logo span{display:inline-block;animation:loaderLetterBounce 1.4s ease-in-out infinite;text-shadow:3px 3px 0 rgba(0,0,0,.15),0 0 30px rgba(255,255,255,.5)}
.loader-logo span:nth-child(1){color:#FF6B9D;animation-delay:0s}
.loader-logo span:nth-child(2){color:#FFA726;animation-delay:.1s}
.loader-logo span:nth-child(3){color:#66BB6A;animation-delay:.2s}
.loader-logo span:nth-child(4){color:#42A5F5;animation-delay:.3s}
.loader-logo span:nth-child(5){color:#AB47BC;animation-delay:.4s}
@keyframes loaderLetterBounce{0%,100%{transform:translateY(0) scale(1)}40%{transform:translateY(-14px) scale(1.1)}}
.loader-sub{font-size:clamp(16px,4vw,22px);font-weight:700;color:#1e3a5f;text-shadow:1px 1px 0 rgba(255,255,255,.7);margin-bottom:28px;animation:loaderSubPulse 2s ease-in-out infinite}
@keyframes loaderSubPulse{0%,100%{opacity:.7}50%{opacity:1}}
.loader-mascots{display:flex;gap:40px;justify-content:center;margin-bottom:32px}
.loader-mascot{font-size:64px;filter:drop-shadow(0 8px 12px rgba(0,0,0,.2));animation:loaderHop 1.2s ease-in-out infinite}
.loader-mascot:nth-child(2){animation-delay:.3s}
@keyframes loaderHop{0%,100%{transform:translateY(0) rotate(-6deg)}50%{transform:translateY(-22px) rotate(6deg)}}
.loader-bar-wrap{width:min(260px,70vw);height:18px;background:rgba(255,255,255,.45);border-radius:20px;overflow:hidden;border:3px solid #fff;box-shadow:0 4px 12px rgba(0,0,0,.12)}
.loader-bar{height:100%;width:0%;background:linear-gradient(90deg,#f472b6,#a78bfa,#38bdf8,#4ade80);background-size:200% 100%;border-radius:16px;animation:loaderBarFill 2.8s cubic-bezier(.4,0,.2,1) forwards,loaderBarShine 1.2s linear infinite}
@keyframes loaderBarFill{0%{width:0%}100%{width:100%}}
@keyframes loaderBarShine{0%{background-position:200% 0}100%{background-position:-200% 0}}
.loader-text{margin-top:14px;font-size:15px;font-weight:700;color:#fff;text-shadow:1px 1px 3px rgba(0,0,0,.2);animation:loaderTextBlink 1s ease-in-out infinite}
@keyframes loaderTextBlink{0%,100%{opacity:.5}50%{opacity:1}}
.loader-sparkles{position:absolute;inset:0;pointer-events:none;z-index:3}
.loader-sparkles span{position:absolute;font-size:16px;animation:loaderSparkle 2s ease-in-out infinite}
.loader-sparkles span:nth-child(1){top:15%;left:15%}
.loader-sparkles span:nth-child(2){top:25%;right:18%;animation-delay:.4s;font-size:20px}
.loader-sparkles span:nth-child(3){top:55%;left:10%;animation-delay:.8s}
.loader-sparkles span:nth-child(4){top:60%;right:12%;animation-delay:1.2s;font-size:14px}
.loader-sparkles span:nth-child(5){top:40%;left:25%;animation-delay:.6s;font-size:12px}
.loader-sparkles span:nth-child(6){top:35%;right:30%;animation-delay:1s}
@keyframes loaderSparkle{0%,100%{opacity:0;transform:scale(.5)}50%{opacity:1;transform:scale(1.3) rotate(20deg)}}

/* ========== 2. PANTALLA DE TÍTULO (tipo Mario Bros) ========== */
#title{
  position:fixed;inset:0;z-index:200;
  display:flex;flex-direction:column;align-items:center;justify-content:center;
  background:linear-gradient(180deg,#5B9BD5 0%,#87CEEB 30%,#B0E0F6 55%,#90EE90 85%,#66BB6A 100%);
  transition:opacity .7s ease,visibility .7s;overflow:hidden;cursor:pointer;
  opacity:0;visibility:hidden;pointer-events:none;
}
#title.show{opacity:1;visibility:visible;pointer-events:auto}
#title.hide{opacity:0;visibility:hidden;pointer-events:none}

.title-hills{
  position:absolute;bottom:0;left:0;right:0;height:32%;
  background:linear-gradient(180deg,transparent 0%,#7CB342 25%,#558B2F 100%);
  border-radius:60% 60% 0 0 / 50px 50px 0 0;z-index:1;
}
.title-hills::before{
  content:'';position:absolute;bottom:35%;left:-15%;width:55%;height:90%;
  background:#8BC34A;border-radius:50%;opacity:.8;
}
.title-hills::after{
  content:'';position:absolute;bottom:25%;right:-10%;width:50%;height:80%;
  background:#689F38;border-radius:50%;opacity:.7;
}

.t-cloud{position:absolute;background:#fff;border-radius:50px;opacity:.9;z-index:2;pointer-events:none;filter:drop-shadow(0 3px 6px rgba(255,255,255,.3))}
.t-cloud::before,.t-cloud::after{content:'';position:absolute;background:#fff;border-radius:50%}
.tc1{width:150px;height:48px;top:6%;left:2%;animation:tCloud 20s ease-in-out infinite}
.tc1::before{width:60px;height:60px;top:-30px;left:20px}.tc1::after{width:75px;height:70px;top:-38px;left:55px}
.tc2{width:120px;height:40px;top:12%;right:4%;animation:tCloud 24s ease-in-out infinite reverse}
.tc2::before{width:50px;height:50px;top:-25px;left:15px}.tc2::after{width:60px;height:55px;top:-30px;left:45px}
.tc3{width:95px;height:34px;top:20%;left:45%;animation:tCloud 16s ease-in-out infinite}
.tc3::before{width:42px;height:42px;top:-22px;left:12px}.tc3::after{width:50px;height:48px;top:-26px;left:38px}
@keyframes tCloud{0%,100%{transform:translateX(0) translateY(0)}25%{transform:translateX(30px) translateY(-6px)}50%{transform:translateX(8px) translateY(4px)}75%{transform:translateX(-20px) translateY(-4px)}}

/* Sol grande sonriente */
.t-sun{
  position:absolute;top:5%;left:5%;z-index:3;
  animation:tSunBob 5s ease-in-out infinite;
}
@keyframes tSunBob{0%,100%{transform:translateY(0) rotate(-4deg)}50%{transform:translateY(-12px) rotate(4deg)}}
.t-sun-face{
  width:90px;height:90px;background:linear-gradient(145deg,#FFE566,#FFC107);border-radius:50%;
  box-shadow:0 0 0 10px rgba(255,235,59,.3),0 0 50px rgba(255,193,7,.55);
  position:relative;display:flex;align-items:center;justify-content:center;
  animation:tSunPulse 3s ease-in-out infinite;
}
@keyframes tSunPulse{0%,100%{transform:scale(1)}50%{transform:scale(1.07)}}
.t-sun-eye{position:absolute;width:12px;height:14px;background:#5D4037;border-radius:50%;top:28%;animation:tBlink 5s ease-in-out infinite}
.t-sun-eye.l{left:24%}.t-sun-eye.r{right:24%}
@keyframes tBlink{0%,44%,50%,100%{transform:scaleY(1)}47%{transform:scaleY(.08)}}
.t-sun-smile{position:absolute;bottom:20%;width:32px;height:16px;border:3.5px solid #5D4037;border-top:none;border-radius:0 0 22px 22px}
.t-ray{position:absolute;width:7px;height:16px;background:#FFD54F;border-radius:4px;top:50%;left:50%;transform-origin:0 0}
.t-ray:nth-child(1){transform:rotate(0deg) translateY(-60px)}
.t-ray:nth-child(2){transform:rotate(45deg) translateY(-60px)}
.t-ray:nth-child(3){transform:rotate(90deg) translateY(-60px)}
.t-ray:nth-child(4){transform:rotate(135deg) translateY(-60px)}
.t-ray:nth-child(5){transform:rotate(180deg) translateY(-60px)}
.t-ray:nth-child(6){transform:rotate(225deg) translateY(-60px)}
.t-ray:nth-child(7){transform:rotate(270deg) translateY(-60px)}
.t-ray:nth-child(8){transform:rotate(315deg) translateY(-60px)}

.t-sparkle{position:absolute;font-size:20px;z-index:4;pointer-events:none;animation:tSparkle 2.8s ease-in-out infinite}
.t-sparkle:nth-child(1){top:10%;right:15%;animation-delay:0s}
.t-sparkle:nth-child(2){top:18%;right:28%;font-size:14px;animation-delay:.5s}
.t-sparkle:nth-child(3){top:8%;right:42%;font-size:12px;animation-delay:1s}
.t-sparkle:nth-child(4){top:22%;left:22%;font-size:16px;animation-delay:1.4s}
@keyframes tSparkle{0%,100%{opacity:.25;transform:scale(.6) rotate(0)}50%{opacity:1;transform:scale(1.25) rotate(18deg)}}

/* Contenido central del título */
.t-content{z-index:10;text-align:center;animation:tContentIn 1.3s cubic-bezier(.34,1.3,.64,1) both;pointer-events:none}
@keyframes tContentIn{0%{opacity:0;transform:translateY(-60px) scale(.6)}70%{transform:translateY(8px) scale(1.04)}100%{opacity:1;transform:translateY(0) scale(1)}}

.t-logo-top{
  font-size:clamp(22px,6vw,36px);font-weight:800;color:#1e3a5f;
  letter-spacing:2px;text-shadow:2px 2px 0 rgba(255,255,255,.85);
  animation:tFloat 3.5s ease-in-out infinite;
}
@keyframes tFloat{0%,100%{transform:translateY(0)}50%{transform:translateY(-7px)}}

.t-logo-main{
  font-size:clamp(48px,14vw,80px);font-weight:800;letter-spacing:3px;line-height:1;
  display:flex;justify-content:center;gap:2px;margin:4px 0 12px;
}
.t-logo-main span{
  display:inline-block;
  animation:tLetterBounce 2.6s ease-in-out infinite;
  text-shadow:4px 4px 0 rgba(0,0,0,.12),0 0 25px rgba(255,255,255,.5);
}
.t-logo-main span:nth-child(1){color:#FF6B9D;animation-delay:0s}
.t-logo-main span:nth-child(2){color:#FFA726;animation-delay:.1s}
.t-logo-main span:nth-child(3){color:#66BB6A;animation-delay:.2s}
.t-logo-main span:nth-child(4){color:#42A5F5;animation-delay:.3s}
.t-logo-main span:nth-child(5){color:#AB47BC;animation-delay:.4s}
@keyframes tLetterBounce{0%,100%{transform:translateY(0) scale(1)}35%{transform:translateY(-12px) scale(1.1)}}

.t-banner{
  display:inline-flex;align-items:center;gap:8px;
  background:linear-gradient(135deg,#CE93D8,#AB47BC,#9C27B0);
  color:#fff;font-size:clamp(13px,3.5vw,17px);font-weight:700;
  padding:9px 24px;border-radius:30px;margin-bottom:20px;
  box-shadow:0 5px 0 #7B1FA2,0 8px 20px rgba(156,39,176,.35);
  animation:tBannerIn 1s cubic-bezier(.34,1.4,.64,1) .6s both;
}
@keyframes tBannerIn{from{transform:scale(.4);opacity:0}to{transform:scale(1);opacity:1}}

.t-mascots{display:flex;gap:50px;justify-content:center;margin:10px 0 28px;animation:tMascotsIn 1s ease .4s both}
@keyframes tMascotsIn{from{transform:scale(0);opacity:0}to{transform:scale(1);opacity:1}}
.t-mascot{font-size:72px;filter:drop-shadow(0 8px 14px rgba(0,0,0,.2));animation:tHop 1.7s ease-in-out infinite}
.t-mascot:nth-child(2){animation-delay:.35s}
@keyframes tHop{0%,100%{transform:translateY(0) rotate(-5deg)}50%{transform:translateY(-20px) rotate(5deg)}}

/* "Pulsa para empezar" parpadeante */
.t-press{
  font-size:clamp(16px,4.5vw,22px);font-weight:800;color:#fff;
  text-shadow:2px 2px 0 #1565C0,0 0 20px rgba(21,101,192,.5);
  animation:tPressBlink 1.4s ease-in-out infinite;
  letter-spacing:1px;
  background:rgba(21,101,192,.25);padding:10px 28px;border-radius:20px;
  border:2px solid rgba(255,255,255,.5);
}
@keyframes tPressBlink{0%,100%{opacity:.35;transform:scale(1)}50%{opacity:1;transform:scale(1.05)}}

.t-flower{position:absolute;bottom:8%;z-index:2;font-size:24px;animation:tSway 3.2s ease-in-out infinite;pointer-events:none}
.t-flower:nth-child(1){left:6%;animation-delay:0s}
.t-flower:nth-child(2){left:18%;font-size:18px;animation-delay:.6s}
.t-flower:nth-child(3){right:8%;animation-delay:1.2s}
.t-flower:nth-child(4){right:20%;font-size:20px;animation-delay:1.8s}
@keyframes tSway{0%,100%{transform:rotate(-10deg)}50%{transform:rotate(10deg)}}

.t-rainbow{
  position:absolute;bottom:28%;right:3%;width:100px;height:50px;
  border-radius:100px 100px 0 0;border:9px solid transparent;
  border-top-color:#FF6B9D;border-left-color:#FFA726;border-right-color:#42A5F5;
  opacity:.5;z-index:2;animation:tRainbow 4s ease-in-out infinite;pointer-events:none;
}
@keyframes tRainbow{0%,100%{opacity:.35;transform:scale(1)}50%{opacity:.65;transform:scale(1.06)}}

/* ========== 3. PANTALLA DE MENÚ (opciones) ========== */
#menu{
  position:fixed;inset:0;z-index:150;
  display:flex;flex-direction:column;align-items:center;justify-content:center;
  background:linear-gradient(180deg,#87CEEB 0%,#B0E0F6 25%,#E0F7FA 55%,#C8E6C9 80%,#A5D6A7 100%);
  transition:opacity .6s ease,visibility .6s;overflow:hidden;
  opacity:0;visibility:hidden;pointer-events:none;
}
#menu.show{opacity:1;visibility:visible;pointer-events:auto}
#menu.hide{opacity:0;visibility:hidden;pointer-events:none}

.menu-hills{
  position:absolute;bottom:0;left:0;right:0;height:26%;
  background:linear-gradient(180deg,transparent 0%,#81C784 30%,#66BB6A 100%);
  border-radius:50% 50% 0 0 / 40px 40px 0 0;z-index:1;
}
.m-cloud{position:absolute;background:#fff;border-radius:50px;opacity:.85;z-index:2;pointer-events:none}
.m-cloud::before,.m-cloud::after{content:'';position:absolute;background:#fff;border-radius:50%}
.mc1{width:120px;height:40px;top:8%;left:5%;animation:tCloud 18s ease-in-out infinite}
.mc1::before{width:50px;height:50px;top:-25px;left:15px}.mc1::after{width:60px;height:55px;top:-30px;left:45px}
.mc2{width:95px;height:32px;top:15%;right:6%;animation:tCloud 22s ease-in-out infinite reverse}
.mc2::before{width:42px;height:42px;top:-20px;left:10px}.mc2::after{width:50px;height:48px;top:-24px;left:38px}

.menu-content{z-index:10;text-align:center;width:90%;max-width:380px;animation:menuIn .7s cubic-bezier(.34,1.3,.64,1) both}
@keyframes menuIn{from{opacity:0;transform:scale(.8) translateY(30px)}to{opacity:1;transform:scale(1) translateY(0)}}

.menu-logo{
  font-size:clamp(28px,8vw,44px);font-weight:800;margin-bottom:6px;
  background:linear-gradient(90deg,#FF6B9D,#FFA726,#66BB6A,#42A5F5,#AB47BC);
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;
}
.menu-sub{font-size:15px;font-weight:600;color:#1e3a5f;margin-bottom:18px;opacity:.8}

.menu-card{
  background:#fff;border-radius:24px;padding:22px 24px;
  box-shadow:0 10px 0 #0ea5e9,0 18px 36px rgba(0,0,0,.14);
  border:4px solid #38bdf8;text-align:center;
}
.menu-title{font-size:19px;font-weight:700;color:#1e3a5f;margin-bottom:14px}
.mode-btn{
  display:flex;align-items:center;justify-content:center;gap:10px;
  width:100%;padding:15px 16px;margin:9px 0;border:none;border-radius:16px;
  font-size:17px;font-weight:700;cursor:pointer;color:#fff;
  box-shadow:0 5px 0 rgba(0,0,0,.2);transition:transform .12s,box-shadow .12s;
}
.mode-btn:hover{transform:translateY(-3px)}
.mode-btn:active{transform:translateY(2px);box-shadow:0 2px 0 rgba(0,0,0,.2)}
.mode-btn.friend{background:linear-gradient(180deg,#4ade80,#22c55e)}
.mode-btn.cpu{background:linear-gradient(180deg,#60a5fa,#3b82f6)}
.mode-btn .emoji{font-size:24px}
.howto-box{
  margin-top:12px;padding:11px 12px;background:#f0f9ff;
  border-radius:14px;font-size:12.5px;color:#334155;line-height:1.5;text-align:left;
}
.howto-box b{color:#0284c7}
.menu-mascots{display:flex;gap:28px;justify-content:center;margin-bottom:12px}
.menu-mascot{font-size:42px;animation:tHop 1.8s ease-in-out infinite}
.menu-mascot:nth-child(2){animation-delay:.3s}

/* ========== JUEGO ========== */
#game{width:100%;max-width:900px;padding:14px;z-index:1;display:none;flex-direction:column;align-items:center;gap:12px}
#game.show{display:flex}
.top-bar{width:100%;display:flex;justify-content:space-between;align-items:center;gap:8px;flex-wrap:wrap}
.turn-badge{background:#fff;border:3px solid #38bdf8;border-radius:16px;padding:9px 16px;font-weight:700;font-size:15px;color:#1e3a5f;display:flex;align-items:center;gap:8px;box-shadow:0 4px 0 #0ea5e9}
.turn-badge.active-red{border-color:#f87171;box-shadow:0 4px 0 #ef4444}
.turn-badge.active-blue{border-color:#60a5fa;box-shadow:0 4px 0 #3b82f6}
.score-pills{display:flex;gap:8px}
.pill{background:#fff;border-radius:12px;padding:7px 12px;font-weight:700;font-size:14px;color:#1e3a5f;border:2px solid #cbd5e1}
.pill.red{border-color:#f87171;background:#fff1f2}.pill.blue{border-color:#60a5fa;background:#eff6ff}
.dice-panel{background:#fff;border:4px solid #38bdf8;border-radius:22px;padding:16px 22px;text-align:center;width:100%;max-width:340px;box-shadow:0 6px 0 #0ea5e9}
#dice{font-size:58px;margin:6px 0}#dice.rolling{animation:diceSpin .45s ease}
@keyframes diceSpin{0%{transform:rotate(0) scale(1)}30%{transform:rotate(120deg) scale(1.25)}60%{transform:rotate(240deg) scale(.9)}100%{transform:rotate(360deg) scale(1)}}
.btn{background:linear-gradient(180deg,#fde047,#facc15);color:#1e3a5f;border:none;padding:13px 26px;border-radius:14px;font-size:17px;font-weight:700;cursor:pointer;box-shadow:0 5px 0 #ca8a04;transition:transform .1s,box-shadow .1s}
.btn:hover:not(:disabled){transform:translateY(-2px)}.btn:active:not(:disabled){transform:translateY(3px);box-shadow:0 2px 0 #ca8a04}
.btn:disabled{opacity:.5;cursor:not-allowed;transform:none}
.btn.green{background:linear-gradient(180deg,#4ade80,#22c55e);color:#fff;box-shadow:0 5px 0 #15803d}
.btn.green:active:not(:disabled){box-shadow:0 2px 0 #15803d}
.btn.ghost{background:#fff;border:2px solid #94a3b8;color:#64748b;box-shadow:0 3px 0 #cbd5e1;padding:10px 16px;font-size:14px}
.board-wrap{width:100%;background:#fff;border-radius:18px;padding:12px;border:4px solid #38bdf8;box-shadow:0 6px 0 #0ea5e9}
#board{display:grid;grid-template-columns:repeat(10,1fr);gap:5px}
.cell{position:relative;aspect-ratio:1;background:#e0f2fe;border-radius:10px;display:flex;align-items:center;justify-content:center;font-weight:700;font-size:clamp(11px,2.2vw,17px);color:#0369a1;border:2px solid #bae6fd}
.cell.start{background:#bbf7d0;color:#15803d;border-color:#86efac}
.cell.finish{background:linear-gradient(135deg,#fde047,#fbbf24);color:#92400e;font-size:clamp(9px,1.7vw,12px);border-color:#f59e0b;box-shadow:0 0 12px rgba(251,191,36,.5)}
.tok{position:absolute;width:42%;aspect-ratio:1;border-radius:50%;border:3px solid #fff;color:#fff;font-size:13px;font-weight:700;display:flex;align-items:center;justify-content:center;box-shadow:0 3px 6px rgba(0,0,0,.3);transition:all .35s cubic-bezier(.34,1.56,.64,1);z-index:2}
.t0{background:#f87171;left:4%;top:6%}.t1{background:#60a5fa;right:4%;bottom:6%}
.tok.bounce{animation:tokPop .4s ease}
@keyframes tokPop{0%{transform:scale(1)}40%{transform:scale(1.4)}100%{transform:scale(1)}}
#qbox{background:#fff;border:4px solid #38bdf8;border-radius:22px;padding:20px 22px;text-align:center;width:100%;max-width:400px;display:none;box-shadow:0 6px 0 #0ea5e9;animation:popIn .3s ease}
#qbox.show{display:block}
@keyframes popIn{from{transform:scale(.85);opacity:0}to{transform:scale(1);opacity:1}}
.q-label{color:#64748b;font-size:14px;font-weight:600;margin-bottom:4px}
.question{font-size:clamp(30px,8vw,44px);font-weight:700;margin:6px 0 14px;color:#0284c7}
.input-row{display:flex;gap:10px;justify-content:center;align-items:center;flex-wrap:wrap}
input#ans{padding:12px 14px;font-size:24px;font-weight:700;width:100px;text-align:center;border:3px solid #7dd3fc;border-radius:14px;background:#f0f9ff;color:#1e3a5f;outline:none}
input#ans:focus{border-color:#0ea5e9;box-shadow:0 0 0 4px rgba(14,165,233,.2)}
#msg{font-size:16px;font-weight:700;min-height:28px;margin-top:12px}#msg.ok{color:#16a34a}#msg.bad{color:#dc2626}
#final{display:none;text-align:center;padding:24px;background:#fff;border-radius:22px;border:4px solid #fbbf24;width:100%;max-width:400px;box-shadow:0 6px 0 #f59e0b;animation:popIn .4s ease}
#final.show{display:block}
.win-title{font-size:26px;font-weight:700;color:#d97706;margin-bottom:6px}
.win-sub{color:#64748b;margin-bottom:16px;font-size:15px}
.confetti{position:fixed;width:12px;height:12px;top:-20px;z-index:400;animation:confettiFall linear forwards}
@keyframes confettiFall{to{transform:translateY(105vh) rotate(720deg);opacity:0}}
@media (max-width:500px){
  .t-logo-main{font-size:42px}.t-mascot{font-size:56px}
  .t-sun-face{width:70px;height:70px}
  .menu-card{padding:16px 14px}.mode-btn{font-size:15px;padding:13px 12px}
  #board{gap:3px}.tok{font-size:10px}
}
</style>
</head>
<body>
<div class="cloud cloud1"></div>
<div class="cloud cloud2"></div>
<div class="cloud cloud3"></div>

<!-- 1. CARGA -->
<div id="loader">
  <div class="loader-bg-sun"></div>
  <div class="loader-cloud lc1"></div>
  <div class="loader-cloud lc2"></div>
  <div class="loader-cloud lc3"></div>
  <div class="loader-sparkles">
    <span>✨</span><span>⭐</span><span>💫</span>
    <span>✨</span><span>🌟</span><span>⭐</span>
  </div>
  <div class="loader-content">
    <div class="loader-logo"><span>S</span><span>u</span><span>m</span><span>a</span><span>s</span></div>
    <div class="loader-sub">¡Carrera de Sumas!</div>
    <div class="loader-mascots">
      <div class="loader-mascot">🦊</div>
      <div class="loader-mascot">🐰</div>
    </div>
    <div class="loader-bar-wrap"><div class="loader-bar"></div></div>
    <div class="loader-text">Cargando aventura...</div>
  </div>
</div>

<!-- 2. TÍTULO / CINEMÁTICA (tipo Mario Bros) — se queda hasta hacer clic -->
<div id="title">
  <div class="title-hills"></div>
  <div class="t-rainbow"></div>
  <div class="t-cloud tc1"></div>
  <div class="t-cloud tc2"></div>
  <div class="t-cloud tc3"></div>
  <div class="t-sun">
    <div class="t-sun-face">
      <div class="t-ray"></div><div class="t-ray"></div><div class="t-ray"></div><div class="t-ray"></div>
      <div class="t-ray"></div><div class="t-ray"></div><div class="t-ray"></div><div class="t-ray"></div>
      <div class="t-sun-eye l"></div><div class="t-sun-eye r"></div>
      <div class="t-sun-smile"></div>
    </div>
  </div>
  <div class="t-sparkle">✨</div>
  <div class="t-sparkle">⭐</div>
  <div class="t-sparkle">💫</div>
  <div class="t-sparkle">🌟</div>
  <div class="t-flower">🌸</div>
  <div class="t-flower">🌼</div>
  <div class="t-flower">🌷</div>
  <div class="t-flower">🌺</div>

  <div class="t-content">
    <div class="t-logo-top">Carrera de</div>
    <div class="t-logo-main">
      <span>S</span><span>u</span><span>m</span><span>a</span><span>s</span>
    </div>
    <div class="t-banner">⭐ ¡Suma, avanza y llega primero! ⭐</div>
    <div class="t-mascots">
      <div class="t-mascot">🦊</div>
      <div class="t-mascot">🐰</div>
    </div>
    <div class="t-press">▶  Pulsa para empezar  ◀</div>
  </div>
</div>

<!-- 3. MENÚ DE OPCIONES -->
<div id="menu">
  <div class="menu-hills"></div>
  <div class="m-cloud mc1"></div>
  <div class="m-cloud mc2"></div>
  <div class="menu-content">
    <div class="menu-mascots">
      <div class="menu-mascot">🦊</div>
      <div class="menu-mascot">🐰</div>
    </div>
    <div class="menu-logo">Carrera de Sumas</div>
    <div class="menu-sub">¡Elige cómo jugar!</div>
    <div class="menu-card">
      <div class="menu-title">¿Con quién quieres jugar?</div>
      <button class="mode-btn friend" onclick="startGame(false)"><span class="emoji">👥</span> Con un amigo</button>
      <button class="mode-btn cpu" onclick="startGame(true)"><span class="emoji">🤖</span> Contra la computadora</button>
      <div class="howto-box"><b>¿Cómo se juega?</b><br>1. Tira el dado 🎲<br>2. Resuelve la suma<br>3. Si aciertas → ¡avanzas!<br>4. Si fallas → te quedas<br>Meta: casilla <b>20</b></div>
    </div>
  </div>
</div>

<!-- 4. JUEGO -->
<div id="game">
  <div class="top-bar">
    <div class="turn-badge" id="turnBadge"><span id="turnEmoji">🦊</span><span id="turn">Turno de Zorro</span></div>
    <div class="score-pills"><div class="pill red" id="score0">🦊 1</div><div class="pill blue" id="score1">🐰 1</div></div>
  </div>
  <div class="dice-panel"><div id="dice">🎲</div><button class="btn" id="rollBtn" onclick="roll()">🎲 ¡Tirar dado!</button></div>
  <div class="board-wrap"><div id="board"></div></div>
  <div id="qbox">
    <p class="q-label">Resuelve la suma para avanzar</p>
    <p class="question" id="qtext">5 + 3 = ?</p>
    <div class="input-row"><input type="text" id="ans" placeholder="?" inputmode="numeric" autocomplete="off"><button class="btn green" onclick="check()">✓ ¡Listo!</button></div>
    <p id="msg"></p>
  </div>
  <div id="final">
    <div class="win-title" id="winTitle">🏆 ¡Ganaste!</div>
    <p class="win-sub" id="winSub"></p>
    <button class="btn green" onclick="restart()">🔄 Jugar otra vez</button><br><br>
    <button class="btn ghost" onclick="goHome()">← Volver al inicio</button>
  </div>
</div>

<script>
const GOAL=20,DICE_FACES=['⚀','⚁','⚂','⚃','⚄','⚅'];
let vsCPU=false,players=[],cur=0,die=0,answer=0,busy=false;

/* Flujo: Carga → Título (espera clic) → Menú → Juego */
(function(){
  // Después de ~3s la carga desaparece y aparece el título
  setTimeout(function(){
    document.getElementById('loader').classList.add('hide');
    document.getElementById('title').classList.add('show');
    setTimeout(function(){
      document.getElementById('loader').style.display='none';
    },800);
  }, 3200);

  // Al hacer clic / tocar en la pantalla de título → menú
  var titleEl = document.getElementById('title');
  function goToMenu(){
    titleEl.classList.remove('show');
    titleEl.classList.add('hide');
    document.getElementById('menu').classList.add('show');
  }
  titleEl.addEventListener('click', goToMenu);
  titleEl.addEventListener('touchend', function(e){ e.preventDefault(); goToMenu(); });
})();

function startGame(cpu){
  vsCPU=cpu;
  players=[{name:'Zorro',pos:0,cls:'t0',emoji:'🦊'},{name:cpu?'Robot':'Conejo',pos:0,cls:'t1',emoji:cpu?'🤖':'🐰'}];
  cur=0;busy=false;
  document.getElementById('menu').classList.remove('show');
  document.getElementById('menu').classList.add('hide');
  document.getElementById('game').classList.add('show');
  document.getElementById('final').classList.remove('show');
  document.getElementById('qbox').classList.remove('show');
  document.getElementById('rollBtn').disabled=false;
  document.getElementById('dice').textContent='🎲';
  buildBoard();updateUI();
}

function goHome(){
  document.getElementById('game').classList.remove('show');
  document.getElementById('final').classList.remove('show');
  document.getElementById('menu').classList.remove('hide');
  document.getElementById('menu').classList.add('show');
}

function restart(){ startGame(vsCPU); }

function buildBoard(){
  const b=document.getElementById('board');b.innerHTML='';
  for(let i=0;i<GOAL;i++){
    const c=document.createElement('div');
    c.className='cell'+(i===0?' start':'')+(i===GOAL-1?' finish':'');
    c.id='c'+i;c.textContent=i===GOAL-1?'🏆 META':(i+1);
    b.appendChild(c);
  }
}

function updateUI(){
  document.querySelectorAll('.tok').forEach(e=>e.remove());
  players.forEach((p,i)=>{
    const cell=document.getElementById('c'+p.pos);
    const t=document.createElement('div');
    t.className='tok '+p.cls;t.textContent=p.emoji;t.id='tok'+i;
    cell.appendChild(t);
  });
  document.getElementById('score0').textContent=players[0].emoji+' '+(players[0].pos+1);
  document.getElementById('score1').textContent=players[1].emoji+' '+(players[1].pos+1);
  const p=players[cur];
  document.getElementById('turn').textContent='Turno de '+p.name;
  document.getElementById('turnEmoji').textContent=p.emoji;
  document.getElementById('turnBadge').className='turn-badge '+(cur===0?'active-red':'active-blue');
}

function roll(){
  if(busy)return;busy=true;
  document.getElementById('rollBtn').disabled=true;
  const diceEl=document.getElementById('dice');
  diceEl.classList.add('rolling');
  let frames=0;
  const interval=setInterval(()=>{
    diceEl.textContent=DICE_FACES[Math.floor(Math.random()*6)];
    frames++;
    if(frames>8){
      clearInterval(interval);
      die=1+Math.floor(Math.random()*6);
      diceEl.textContent=DICE_FACES[die-1];
      diceEl.classList.remove('rolling');
      setTimeout(ask,280);
    }
  },55);
}

function ask(){
  const a=1+Math.floor(Math.random()*10),b=1+Math.floor(Math.random()*10);
  answer=a+b;
  document.getElementById('qtext').textContent=a+' + '+b+' = ?';
  document.getElementById('ans').value='';
  document.getElementById('msg').textContent='';
  document.getElementById('msg').className='';
  document.getElementById('qbox').classList.add('show');
  if(vsCPU&&cur===1){
    document.getElementById('ans').disabled=true;
    setTimeout(()=>{
      const ok=Math.random()<.65;
      finish(ok,ok?'✅ ¡El Robot acertó!':'❌ El Robot se equivocó.');
    },1300);
  }else{
    document.getElementById('ans').disabled=false;
    document.getElementById('ans').focus();
  }
}

function check(){
  if(document.getElementById('ans').disabled)return;
  const v=parseInt(document.getElementById('ans').value,10);
  const ok=v===answer;
  finish(ok,ok?'✅ ¡Muy bien! Avanzas '+die+(die===1?' casilla.':' casillas.'):'❌ Casi... Era '+answer+'. No avanzas.');
}

function finish(ok,text){
  const msg=document.getElementById('msg');
  msg.textContent=text;msg.className=ok?'ok':'bad';
  const p=players[cur];
  if(ok){
    p.pos=Math.min(GOAL-1,p.pos+die);
    updateUI();
    const tok=document.getElementById('tok'+cur);
    if(tok)tok.classList.add('bounce');
    if(p.pos===GOAL-1){
      setTimeout(()=>{
        document.getElementById('qbox').classList.remove('show');
        document.getElementById('rollBtn').disabled=true;
        document.getElementById('winTitle').textContent='🏆 ¡'+p.name+' GANA!';
        document.getElementById('winSub').textContent='¡Llegó a la meta primero! 🎉';
        document.getElementById('final').classList.add('show');
        launchConfetti();
      },650);
      return;
    }
  }
  setTimeout(()=>{
    document.getElementById('qbox').classList.remove('show');
    cur=1-cur;busy=false;
    document.getElementById('rollBtn').disabled=false;
    updateUI();
    if(vsCPU&&cur===1)setTimeout(roll,850);
  },1050);
}

function launchConfetti(){
  const colors=['#f87171','#60a5fa','#4ade80','#fde047','#c4b5fd','#fb923c','#f9a8d4'];
  for(let i=0;i<55;i++){
    const c=document.createElement('div');
    c.className='confetti';
    c.style.left=Math.random()*100+'vw';
    c.style.background=colors[Math.floor(Math.random()*colors.length)];
    c.style.width=(8+Math.random()*10)+'px';
    c.style.height=(8+Math.random()*10)+'px';
    c.style.borderRadius=Math.random()>.4?'50%':'3px';
    c.style.animationDuration=(1.6+Math.random()*2)+'s';
    c.style.animationDelay=Math.random()*.7+'s';
    document.body.appendChild(c);
    setTimeout(()=>c.remove(),4200);
  }
}

document.getElementById('ans').addEventListener('keydown',e=>{if(e.key==='Enter')check()});
</script>
<script>
if('serviceWorker' in navigator){
  window.addEventListener('load',()=>{
    navigator.serviceWorker.register('./sw.js').catch(err=>console.log('SW reg failed',err));
  });
}
</script>
</body>
</html>
