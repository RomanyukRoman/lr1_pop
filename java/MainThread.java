public class MainThread extends Thread {
    private final int id;
    private final int step;
    private final BreakThread breakThread;

    public MainThread(int id, BreakThread breakThread, int step) {
        this.id = id;
        this.breakThread = breakThread;
        this.step = step;
    }
    @Override
    public void run() {
        long sum = 0;
        int terms = 0;
        boolean isStop = false;
        do{
            sum = sum + step;
            terms ++;
            isStop = breakThread.isCanBreak();
        } while (!isStop);
        System.out.println("Thread ID: " +  id + ": " + "Sum: " + sum + " Terms: " + terms);
    }
}
