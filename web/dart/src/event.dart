part of event;

class Pid { }

class EventListener {
  void send (Map message, Pid sender_pid);
}

class Event {

  static Map _listeners = new Map();

  static Pid register(EventListener listener, [Pid pid]) {
    if (pid == null) {
      pid = new Pid();
    }
    _listeners[pid] = listener;
    return pid;
  }

  static EventListener find (pid) => _listeners[pid];

  Event(Pid pid, Map message, [Pid sender_pid]) {
    EventListener listeners = Event.find(pid);
    listeners.send(message);
  }

}
