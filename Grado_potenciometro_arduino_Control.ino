const int sensorPin = A0;
float sensorValor = 0;
float Valor = 0;
float KP=1,Ki=0.001,Kd=0.1;
float ref=370;
float error=0, eri=0,errd=0,gama,u;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(3,OUTPUT);
  pinMode(6,OUTPUT);
  digitalWrite(3,LOW);
}

void loop() {
  //error=0;
  //put your main code here, to run repeatedly:
  //analogWrite(6,50);
  /*digitalWrite(6,HIGH);
  delay(1000);
  
  digitalWrite(6,LOW);
  //analogWrite(6,0);
  delay(1000);*/
  
 sensorValor = analogRead(sensorPin);
 Serial.println(sensorValor);
 error=(ref-sensorValor);
 eri=eri+error;
 u=KP*error+Ki*eri+Kd*errd;
 if(u>255){
  u=255;
 }
 Valor=u;
 analogWrite(6,Valor);
   Serial.println(Valor);
 /*Valor=abs((370-sensorValor)*KP);
  analogWrite(6,Valor);
   Serial.println(Valor);
 */
}
