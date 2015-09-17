 class Client {
     private native void print();
     public static void main(String[] args) {
         new Client().print();
     }
     static {
         System.loadLibrary("nativecrypt");
     }
 }
