package sergentum.sync;

public abstract class Synchronizer {
    public enum RequestMethod { GET, POST, PATCH, PUT }

    public enum Status {
        OK, ERROR, FAIL, SKIP, NEED_AUTH;
        public Exception ex = null;
        public String message = null ;

        public String toConsoleString() {
            return "Status{" + this.name() +
                    ", message='" + message + '\'' +
                    "\nex=" + ex +
                    '}';
        }
    }
}
