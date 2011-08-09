package com.mobx.protocol;

/**
 * A mobx message consists of two parts,
 * 
 * 1. a fixed length of message header
 *    the length of message header is 64 bytes,
 *    the format of a mobx message is like
 *    | 4 (MOBX) |   8  (length of the whole message) |  4 (message type)   |     48 unused bytes  |
 * 2. a vary length of message body
 * @author wallacepeng
 *
 */
public interface IMessage {
	public IMessageHeader getHeader();
	public IMessageBody getBody();
}
