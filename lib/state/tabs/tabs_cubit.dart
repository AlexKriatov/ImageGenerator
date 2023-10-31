import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whimsy_games_preview_generator/state/tabs/tabs_state.dart';

class TabsCubit extends Cubit<TabsState> {
  TabsCubit() : super(TabsState.eight);

  void setTwoItemsView(){
    if(state != TabsState.two){
      emit(TabsState.two);
    }
  }

  void setFourItemsView(){
    if(state != TabsState.four){
      emit(TabsState.four);
    }
  }

  void setEightItemsView(){
    if(state != TabsState.eight){
      emit(TabsState.eight);
    }
  }
}
