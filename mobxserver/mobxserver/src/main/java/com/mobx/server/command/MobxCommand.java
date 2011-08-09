package com.mobx.server.command;

public class MobxCommand {

	public static final int LOGIN = 0;
	public static final int GETUSER = 1;
	public static final int CREATEUSER = 2;
	public static final int DELETEUSER = 3;

    private final int num;

    private MobxCommand(int num) {
        this.num = num;
    }

    public int toInt() {
        return num;
    }
    
    public static MobxCommand valueOf(String s) {
        s = s.toUpperCase();
        if ("LOGIN".equals(s)) {
            return new MobxCommand(LOGIN);
        }
        if ("GETUSER".equals(s)) {
            return new MobxCommand(GETUSER);
        }
        if ("CREATEUSER".equals(s)) {
            return new MobxCommand(CREATEUSER);
        }
        if ("DELETEUSER".equals(s)) {
            return new MobxCommand(DELETEUSER);
        }

        throw new IllegalArgumentException("Unrecognized command: " + s);
    }
}
