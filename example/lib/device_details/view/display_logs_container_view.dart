import 'package:flutter/material.dart';
import 'package:blemulator_example/device_details/device_details_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LogsContainerView extends StatelessWidget {
  final Stream<List<DebugLog>> _logs;

  LogsContainerView(this._logs);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: SizedBox.expand(
        child: Column(
          children: <Widget>[
            Flexible(
              child: StreamBuilder<List<DebugLog>>(
                initialData: [],
                stream: _logs,
                builder: (context, snapshot) => _buildLogs(context, snapshot),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogs(BuildContext context, AsyncSnapshot<List<DebugLog>> logs) {
    return ListView.builder(
      itemCount: logs.data.length,
      shrinkWrap: true,
      itemBuilder: (buildContext, index) => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  logs.data[index].time,
                  style: TextStyle(fontSize: 9),
                ),
              ),
              Flexible(
                child: Text(logs.data[index].content,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
