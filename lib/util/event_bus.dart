enum EventBusType {
  updateHomeList,
  updateAttentionStatus,
  update,
  updateLiveDialogShowUI,
  refreshMoney,
  animateEnd,
  webViewBackClick,
  updateLiveRank,
  updateMsgList,
  liveFollowUser,
}



//  订阅者回调签名
typedef void EventCallback(arg);

class EventBus {
  EventBus._internal();

  static EventBus _singleton = EventBus._internal();

  factory EventBus() => _singleton;

  //  保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  var _tempMap = Map<Object, List<EventCallback>>();

  //添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _tempMap[eventName] ??= [];
    _tempMap[eventName]?.add(f);
  }

  //  移除订阅者
  void off(eventName, [EventCallback? f]) {
    var list = _tempMap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _tempMap[eventName] = <EventCallback>[];
    } else {
      list.remove(f);
    }
  }

  //  触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _tempMap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    //  反向遍历，防止在订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}

//  定义一个top-level变量，页面引入该文件后可以直接使用bus
var eventBus = EventBus();
