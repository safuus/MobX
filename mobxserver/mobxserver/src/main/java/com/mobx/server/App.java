package com.mobx.server;

import java.net.InetSocketAddress;
import java.nio.charset.Charset;

import org.apache.mina.core.filterchain.DefaultIoFilterChainBuilder;
import org.apache.mina.filter.codec.ProtocolCodecFilter;
import org.apache.mina.filter.codec.textline.LineDelimiter;
import org.apache.mina.filter.codec.textline.TextLineCodecFactory;
import org.apache.mina.filter.logging.LoggingFilter;
import org.apache.mina.filter.logging.MdcInjectionFilter;
import org.apache.mina.transport.socket.nio.NioSocketAcceptor;

import com.mobx.server.context.MobxApplicationContext;
import com.mobx.server.handler.MobxProtocolHandler;

/**
 * MobX Server.
 *
 */
public class App 
{
    /** Choose your favorite port number. */
    private static final int PORT = 9088;

    /**
     * Initialize the spring and hibernate layer.
     */
    private static void initialize() {
    	MobxApplicationContext.initialize();
    }
    
    public static void main( String[] args ) throws Exception
    {
    	initialize();
    	
        NioSocketAcceptor acceptor = new NioSocketAcceptor();
        DefaultIoFilterChainBuilder chain = acceptor.getFilterChain();

        MdcInjectionFilter mdcInjectionFilter = new MdcInjectionFilter();
        chain.addLast("mdc", mdcInjectionFilter);

        // We can customize the line delimiter. We can also change to use stream io handler later. Line command is enough for now.
        chain.addLast("codec", new ProtocolCodecFilter(
                new TextLineCodecFactory(Charset.defaultCharset(), LineDelimiter.CRLF, LineDelimiter.CRLF)));

        addLogger(chain);        

        // Bind
        acceptor.setHandler(new MobxProtocolHandler());
        acceptor.bind(new InetSocketAddress(PORT));

        System.out.println("Listening on port " + PORT);
    }
    
    private static void addLogger(DefaultIoFilterChainBuilder chain)
            throws Exception {
        chain.addLast("logger", new LoggingFilter());
        System.out.println("Logging ON");
    }
}
