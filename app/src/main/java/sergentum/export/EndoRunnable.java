package sergentum.export;

public class EndoRunnable implements Runnable {

    MifitStarter starter;

    public EndoRunnable(MifitStarter starter) {
        this.starter = starter;
    }

    @Override
    public void run() {
        starter.synchronize();
    }
}
