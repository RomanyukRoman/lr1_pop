public class Main {
    public static void main(String[] args) {
        BreakThread breakThread = new BreakThread();
        int count = 4;
        int step = 2;
        for(int i = 1; i <= count; i++)
        {
             new MainThread(i, breakThread, step).start();
        }
        new Thread(breakThread).start();
    }
}
