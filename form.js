function wightCalculator(valNum){
    document.getElementById("pounds").value=valNum*2.20462;
    document.getElementById("gram").value=valNum*1000;
    document.getElementById("milli").value=valNum*1000000;
    document.getElementById("uston").value=valNum*0.00110231;
}

function forReset(){
    document.getElementById("forme").reset();
}