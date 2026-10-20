const GOAL=20,DICE_FACES=['⚀','⚁','⚂','⚃','⚄','⚅'];
let vsCPU=false,players=[],cur=0,die=0,answer=0,busy=false;

(function(){
  setTimeout(function(){
    document.getElementById('loader').classList.add('hide');
    document.getElementById('title').classList.add('show');
    setTimeout(function(){
      document.getElementById('loader').style.display='none';
    },800);
  }, 3200);

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
