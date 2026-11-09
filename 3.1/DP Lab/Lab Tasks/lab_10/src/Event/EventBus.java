package Event;

import java.util.LinkedList;
import java.util.Queue;

public class EventBus {
    private Queue<Event> eventQueue = new LinkedList<>();

    public void publish(Event event) {
        eventQueue.add(event);
    }

    public void processEvents() {
        while (!eventQueue.isEmpty()) {
            Event event = eventQueue.poll();
            event.process();
        }
    }
}
