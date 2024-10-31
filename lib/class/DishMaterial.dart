class DishMaterial {
  String _dishMaterialName;
  String _dishMaterialMass;
  String _dishMaterialCalories;

  DishMaterial(this._dishMaterialName, this._dishMaterialMass, this._dishMaterialCalories);

  String get dishMaterialName => _dishMaterialName;
  String get dishMaterialMass => _dishMaterialMass;
  String get dishMaterialCalories => _dishMaterialCalories;
}