class ProceedOrder
  include Interactor::Organizer

  organize FindOrder, UpdateOrder
end
