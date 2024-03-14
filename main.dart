import "dart:io";

class Vehicle{
  String _merk = "";
  String _model = "";
  int _cc = 0;

  Vehicle(this._merk, this._model, this._cc);

  set setMerk(String merk){
    this._merk = merk;
  }

  String get getMerk{
    return this._merk;
  }

  set setModel(String model){
    this._model = model;
  }

  String get getModel{
    return this._model;
  }

  set setCc(int cc){
    this._cc = cc;
  }

  int get getCc{
    return this._cc;
  }

  void gas(){
    print("Ngeengggg...");
  }
}

class Car extends Vehicle{
  int _jmlPintu = 0;

  Car(this._jmlPintu, String merk, String model, int cc) : super(merk, model, cc);

  set setJmlPintu(int jmlPintu){
    this._jmlPintu = jmlPintu;
  }

  int get getJmlPintu{
    return this._jmlPintu;
  }

  void gas(){
    print("Vrooommm...");
  }
}

class Motorcycle extends Vehicle{
  String _jenisMesin = "";

  Motorcycle(this._jenisMesin, String merk, String model, int cc) : super(merk, model, cc);

  set setJenisMesin(String jenisMesin){
    this._jenisMesin = jenisMesin;
  }

  String get getJenisMesin{
    return this._jenisMesin;
  }

  void gas(){
    print("Mberrrrrr...");
  }
}

Future<void> jalan(Vehicle obj, int n){
  return Future.delayed(Duration(seconds: n), () {
    obj.gas();
  });
}
void main() async {
  Car mobilArya = Car(4, "Toyota", "Yaris", 1800);
  print("Spek Mobil Arya");
  print("Merk\t\t:${mobilArya.getMerk}\nNama\t\t:${mobilArya.getModel}\nCC\t\t:${mobilArya.getCc}\nJumlah Pintu\t:${mobilArya.getJmlPintu}\n");

  print("Spek Motor Tata");
  Motorcycle motorTata = Motorcycle("Karburator", "Honda", "Beat", 125);
  print("Merk\t\t:${motorTata.getMerk}\nNama\t\t:${motorTata.getModel}\nCC\t\t:${motorTata.getCc}\nJenis Mesin\t:${motorTata.getJenisMesin}\n");

  List<Vehicle> listVehicle = [mobilArya, motorTata];
  for(Vehicle obj in listVehicle){
    stdout.write("${obj.getMerk} ${obj.getModel} suaranya ");
    obj.gas();
  }

  print("\nMobil Arya akan jalan 4 detik lagi");
  print("Motor Tata akan jalan 2 detik setelah mobil Arya jalan\n");

  await jalan(mobilArya, 4);
  jalan(motorTata, 2);

  print("Ternyata ada bebek menyeberang jalan.... kwek kwek");
}