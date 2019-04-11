// This lazy dude wrote code to auto-accept and close all cases!
trigger LazyEmployee on Case (before insert) {
  for (Case newCase : Trigger.new) {
    newCase.Status  = 'Closed';
    newCase.OwnerId = '005i0000002oLPk';
  }
}