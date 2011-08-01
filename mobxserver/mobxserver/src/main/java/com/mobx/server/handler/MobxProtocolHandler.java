package com.mobx.server.handler;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mobx.server.command.MobxCommand;

public class MobxProtocolHandler extends IoHandlerAdapter {
	private final static Logger LOGGER = LoggerFactory.getLogger(MobxProtocolHandler.class);
	
    private final Set<IoSession> sessions = Collections
            .synchronizedSet(new HashSet<IoSession>());

    private final Set<String> users = Collections
            .synchronizedSet(new HashSet<String>());

    @Override
    public void exceptionCaught(IoSession session, Throwable cause) {
        LOGGER.warn("Unexpected exception.", cause);
        // Close connection when unexpected exception is caught.
        session.close(true);
    }

    @Override
    public void messageReceived(IoSession session, Object message) {
        Logger log = LoggerFactory.getLogger(MobxProtocolHandler.class);
        log.info("received: " + message);
        String theMessage = (String) message;
        String[] result = theMessage.split(" ", 2);
        String theCommand = result[0];

        try {

            MobxCommand command = MobxCommand.valueOf(theCommand);

            switch (command.toInt()) {
 

            default:
                LOGGER.info("Unhandled command: " + command);
                break;
            }

        } catch (IllegalArgumentException e) {
            LOGGER.debug("Illegal argument", e);
        }
    }


    @Override
    public void sessionClosed(IoSession session) throws Exception {

    }

}
