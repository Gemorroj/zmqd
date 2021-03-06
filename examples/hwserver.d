// Hello World server
import core.thread, core.time;
import std.stdio;
import zmqd;

void main()
{
    // Socket to talk to clients
    auto responder = Socket(SocketType.rep);
    responder.bind("tcp://*:5555");

    while (true) {
        ubyte[10] buffer;
        responder.receive(buffer);
        writeln("Received Hello");
        Thread.sleep(1.seconds);
        responder.send("World");
    }
}
