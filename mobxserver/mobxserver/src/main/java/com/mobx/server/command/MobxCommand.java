package com.mobx.server.command;

public class MobxCommand {

	public static final int LOGIN = 0;
	public static final int CREATE_PROFILE = 1;
	public static final int DELETE_PROFILE = 2;

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
        if ("CREATE_PROFILE".equals(s)) {
            return new MobxCommand(CREATE_PROFILE);
        }
        if ("DELETE_PROFILE".equals(s)) {
            return new MobxCommand(DELETE_PROFILE);
        }

        throw new IllegalArgumentException("Unrecognized command: " + s);
    }
}
