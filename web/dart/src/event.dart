part of event;

class Pid { }

//interface EventListener;

class Event {

  static Map _processes = new Map();

  static Pid register(Object process, [Pid pid]) {
    if (pid == null) {
      pid = new Pid();
    }
    _processes[pid] = process;
    return pid;
  }

  static Object find (pid) => _processes[pid];

  Event(Pid pid, Map message, [Pid sender_pid]) {
    Object process = Event.find(pid);
    process.listener(message);
  }

}

//new Event(pid, {'mana:change' : 5});
