/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.31
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public class OBAtom extends OBBase {
  private long swigCPtr;

  protected OBAtom(long cPtr, boolean cMemoryOwn) {
    super(openbabelJNI.SWIGOBAtomUpcast(cPtr), cMemoryOwn);
    swigCPtr = cPtr;
  }

  protected static long getCPtr(OBAtom obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if(swigCPtr != 0 && swigCMemOwn) {
      swigCMemOwn = false;
      openbabelJNI.delete_OBAtom(swigCPtr);
    }
    swigCPtr = 0;
    super.delete();
  }

  public void setVisit(boolean value) {
    openbabelJNI.OBAtom_Visit_set(swigCPtr, this, value);
  }

  public boolean getVisit() {
    return openbabelJNI.OBAtom_Visit_get(swigCPtr, this);
  }

  public OBAtom() {
    this(openbabelJNI.new_OBAtom(), true);
  }

  public boolean Clear() {
    return openbabelJNI.OBAtom_Clear(swigCPtr, this);
  }

  public void SetIdx(int idx) {
    openbabelJNI.OBAtom_SetIdx(swigCPtr, this, idx);
  }

  public void SetHyb(int hyb) {
    openbabelJNI.OBAtom_SetHyb(swigCPtr, this, hyb);
  }

  public void SetAtomicNum(int atomicnum) {
    openbabelJNI.OBAtom_SetAtomicNum(swigCPtr, this, atomicnum);
  }

  public void SetIsotope(long iso) {
    openbabelJNI.OBAtom_SetIsotope(swigCPtr, this, iso);
  }

  public void SetImplicitValence(int val) {
    openbabelJNI.OBAtom_SetImplicitValence(swigCPtr, this, val);
  }

  public void IncrementImplicitValence() {
    openbabelJNI.OBAtom_IncrementImplicitValence(swigCPtr, this);
  }

  public void DecrementImplicitValence() {
    openbabelJNI.OBAtom_DecrementImplicitValence(swigCPtr, this);
  }

  public void SetFormalCharge(int fcharge) {
    openbabelJNI.OBAtom_SetFormalCharge(swigCPtr, this, fcharge);
  }

  public void SetSpinMultiplicity(short spin) {
    openbabelJNI.OBAtom_SetSpinMultiplicity(swigCPtr, this, spin);
  }

  public void SetType(String type) {
    openbabelJNI.OBAtom_SetType__SWIG_0(swigCPtr, this, type);
  }

  public void SetType(SWIGTYPE_p_std__string type) {
    openbabelJNI.OBAtom_SetType__SWIG_1(swigCPtr, this, SWIGTYPE_p_std__string.getCPtr(type));
  }

  public void SetPartialCharge(double pcharge) {
    openbabelJNI.OBAtom_SetPartialCharge(swigCPtr, this, pcharge);
  }

  public void SetVector(vector3 v) {
    openbabelJNI.OBAtom_SetVector__SWIG_0(swigCPtr, this, vector3.getCPtr(v), v);
  }

  public void SetVector(double x, double y, double z) {
    openbabelJNI.OBAtom_SetVector__SWIG_1(swigCPtr, this, x, y, z);
  }

  public void SetCoordPtr(SWIGTYPE_p_p_double c) {
    openbabelJNI.OBAtom_SetCoordPtr(swigCPtr, this, SWIGTYPE_p_p_double.getCPtr(c));
  }

  public void SetVector() {
    openbabelJNI.OBAtom_SetVector__SWIG_2(swigCPtr, this);
  }

  public void SetResidue(OBResidue res) {
    openbabelJNI.OBAtom_SetResidue(swigCPtr, this, OBResidue.getCPtr(res), res);
  }

  public void SetParent(OBMol ptr) {
    openbabelJNI.OBAtom_SetParent(swigCPtr, this, OBMol.getCPtr(ptr), ptr);
  }

  public void SetAromatic() {
    openbabelJNI.OBAtom_SetAromatic(swigCPtr, this);
  }

  public void UnsetAromatic() {
    openbabelJNI.OBAtom_UnsetAromatic(swigCPtr, this);
  }

  public void SetClockwiseStereo() {
    openbabelJNI.OBAtom_SetClockwiseStereo(swigCPtr, this);
  }

  public void SetAntiClockwiseStereo() {
    openbabelJNI.OBAtom_SetAntiClockwiseStereo(swigCPtr, this);
  }

  public void SetPositiveStereo() {
    openbabelJNI.OBAtom_SetPositiveStereo(swigCPtr, this);
  }

  public void SetNegativeStereo() {
    openbabelJNI.OBAtom_SetNegativeStereo(swigCPtr, this);
  }

  public void UnsetStereo() {
    openbabelJNI.OBAtom_UnsetStereo(swigCPtr, this);
  }

  public void SetInRing() {
    openbabelJNI.OBAtom_SetInRing(swigCPtr, this);
  }

  public void SetChiral() {
    openbabelJNI.OBAtom_SetChiral(swigCPtr, this);
  }

  public void ClearCoordPtr() {
    openbabelJNI.OBAtom_ClearCoordPtr(swigCPtr, this);
  }

  public int GetFormalCharge() {
    return openbabelJNI.OBAtom_GetFormalCharge(swigCPtr, this);
  }

  public long GetAtomicNum() {
    return openbabelJNI.OBAtom_GetAtomicNum(swigCPtr, this);
  }

  public int GetIsotope() {
    return openbabelJNI.OBAtom_GetIsotope(swigCPtr, this);
  }

  public int GetSpinMultiplicity() {
    return openbabelJNI.OBAtom_GetSpinMultiplicity(swigCPtr, this);
  }

  public double GetAtomicMass() {
    return openbabelJNI.OBAtom_GetAtomicMass(swigCPtr, this);
  }

  public double GetExactMass() {
    return openbabelJNI.OBAtom_GetExactMass(swigCPtr, this);
  }

  public long GetIdx() {
    return openbabelJNI.OBAtom_GetIdx(swigCPtr, this);
  }

  public long GetCoordinateIdx() {
    return openbabelJNI.OBAtom_GetCoordinateIdx(swigCPtr, this);
  }

  public long GetCIdx() {
    return openbabelJNI.OBAtom_GetCIdx(swigCPtr, this);
  }

  public long GetValence() {
    return openbabelJNI.OBAtom_GetValence(swigCPtr, this);
  }

  public long GetHyb() {
    return openbabelJNI.OBAtom_GetHyb(swigCPtr, this);
  }

  public long GetImplicitValence() {
    return openbabelJNI.OBAtom_GetImplicitValence(swigCPtr, this);
  }

  public long GetHvyValence() {
    return openbabelJNI.OBAtom_GetHvyValence(swigCPtr, this);
  }

  public long GetHeteroValence() {
    return openbabelJNI.OBAtom_GetHeteroValence(swigCPtr, this);
  }

  public String GetType() {
    return openbabelJNI.OBAtom_GetType(swigCPtr, this);
  }

  public double GetX() {
    return openbabelJNI.OBAtom_GetX(swigCPtr, this);
  }

  public double GetY() {
    return openbabelJNI.OBAtom_GetY(swigCPtr, this);
  }

  public double GetZ() {
    return openbabelJNI.OBAtom_GetZ(swigCPtr, this);
  }

  public double x() {
    return openbabelJNI.OBAtom_x(swigCPtr, this);
  }

  public double y() {
    return openbabelJNI.OBAtom_y(swigCPtr, this);
  }

  public double z() {
    return openbabelJNI.OBAtom_z(swigCPtr, this);
  }

  public SWIGTYPE_p_double GetCoordinate() {
    long cPtr = openbabelJNI.OBAtom_GetCoordinate(swigCPtr, this);
    return (cPtr == 0) ? null : new SWIGTYPE_p_double(cPtr, false);
  }

  public vector3 GetVector() {
    return new vector3(openbabelJNI.OBAtom_GetVector(swigCPtr, this), false);
  }

  public double GetPartialCharge() {
    return openbabelJNI.OBAtom_GetPartialCharge(swigCPtr, this);
  }

  public OBResidue GetResidue() {
    long cPtr = openbabelJNI.OBAtom_GetResidue(swigCPtr, this);
    return (cPtr == 0) ? null : new OBResidue(cPtr, false);
  }

  public OBMol GetParent() {
    long cPtr = openbabelJNI.OBAtom_GetParent(swigCPtr, this);
    return (cPtr == 0) ? null : new OBMol(cPtr, false);
  }

  public boolean GetNewBondVector(vector3 v, double length) {
    return openbabelJNI.OBAtom_GetNewBondVector(swigCPtr, this, vector3.getCPtr(v), v, length);
  }

  public OBBond GetBond(OBAtom arg0) {
    long cPtr = openbabelJNI.OBAtom_GetBond(swigCPtr, this, OBAtom.getCPtr(arg0), arg0);
    return (cPtr == 0) ? null : new OBBond(cPtr, false);
  }

  public OBAtom GetNextAtom() {
    long cPtr = openbabelJNI.OBAtom_GetNextAtom(swigCPtr, this);
    return (cPtr == 0) ? null : new OBAtom(cPtr, false);
  }

  public SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator BeginBonds() {
    return new SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator(openbabelJNI.OBAtom_BeginBonds(swigCPtr, this), true);
  }

  public SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator EndBonds() {
    return new SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator(openbabelJNI.OBAtom_EndBonds(swigCPtr, this), true);
  }

  public OBBond BeginBond(SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator i) {
    long cPtr = openbabelJNI.OBAtom_BeginBond(swigCPtr, this, SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator.getCPtr(i));
    return (cPtr == 0) ? null : new OBBond(cPtr, false);
  }

  public OBBond NextBond(SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator i) {
    long cPtr = openbabelJNI.OBAtom_NextBond(swigCPtr, this, SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator.getCPtr(i));
    return (cPtr == 0) ? null : new OBBond(cPtr, false);
  }

  public OBAtom BeginNbrAtom(SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator i) {
    long cPtr = openbabelJNI.OBAtom_BeginNbrAtom(swigCPtr, this, SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator.getCPtr(i));
    return (cPtr == 0) ? null : new OBAtom(cPtr, false);
  }

  public OBAtom NextNbrAtom(SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator i) {
    long cPtr = openbabelJNI.OBAtom_NextNbrAtom(swigCPtr, this, SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator.getCPtr(i));
    return (cPtr == 0) ? null : new OBAtom(cPtr, false);
  }

  public double GetDistance(int index) {
    return openbabelJNI.OBAtom_GetDistance__SWIG_0(swigCPtr, this, index);
  }

  public double GetDistance(OBAtom arg0) {
    return openbabelJNI.OBAtom_GetDistance__SWIG_1(swigCPtr, this, OBAtom.getCPtr(arg0), arg0);
  }

  public double GetAngle(int b, int c) {
    return openbabelJNI.OBAtom_GetAngle__SWIG_0(swigCPtr, this, b, c);
  }

  public double GetAngle(OBAtom b, OBAtom c) {
    return openbabelJNI.OBAtom_GetAngle__SWIG_1(swigCPtr, this, OBAtom.getCPtr(b), b, OBAtom.getCPtr(c), c);
  }

  public void NewResidue() {
    openbabelJNI.OBAtom_NewResidue(swigCPtr, this);
  }

  public void AddResidue(OBResidue res) {
    openbabelJNI.OBAtom_AddResidue(swigCPtr, this, OBResidue.getCPtr(res), res);
  }

  public void DeleteResidue() {
    openbabelJNI.OBAtom_DeleteResidue(swigCPtr, this);
  }

  public void AddBond(OBBond bond) {
    openbabelJNI.OBAtom_AddBond(swigCPtr, this, OBBond.getCPtr(bond), bond);
  }

  public void InsertBond(SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator i, OBBond bond) {
    openbabelJNI.OBAtom_InsertBond(swigCPtr, this, SWIGTYPE_p_std__vectorTOpenBabel__OBBond_p_t__iterator.getCPtr(i), OBBond.getCPtr(bond), bond);
  }

  public boolean DeleteBond(OBBond bond) {
    return openbabelJNI.OBAtom_DeleteBond(swigCPtr, this, OBBond.getCPtr(bond), bond);
  }

  public void ClearBond() {
    openbabelJNI.OBAtom_ClearBond(swigCPtr, this);
  }

  public boolean HtoMethyl() {
    return openbabelJNI.OBAtom_HtoMethyl(swigCPtr, this);
  }

  public boolean SetHybAndGeom(int arg0) {
    return openbabelJNI.OBAtom_SetHybAndGeom(swigCPtr, this, arg0);
  }

  public void ForceNoH() {
    openbabelJNI.OBAtom_ForceNoH(swigCPtr, this);
  }

  public boolean HasNoHForced() {
    return openbabelJNI.OBAtom_HasNoHForced(swigCPtr, this);
  }

  public long CountFreeOxygens() {
    return openbabelJNI.OBAtom_CountFreeOxygens(swigCPtr, this);
  }

  public long ImplicitHydrogenCount() {
    return openbabelJNI.OBAtom_ImplicitHydrogenCount(swigCPtr, this);
  }

  public long ExplicitHydrogenCount(boolean ExcludeIsotopes) {
    return openbabelJNI.OBAtom_ExplicitHydrogenCount__SWIG_0(swigCPtr, this, ExcludeIsotopes);
  }

  public long ExplicitHydrogenCount() {
    return openbabelJNI.OBAtom_ExplicitHydrogenCount__SWIG_1(swigCPtr, this);
  }

  public long MemberOfRingCount() {
    return openbabelJNI.OBAtom_MemberOfRingCount(swigCPtr, this);
  }

  public long MemberOfRingSize() {
    return openbabelJNI.OBAtom_MemberOfRingSize(swigCPtr, this);
  }

  public long CountRingBonds() {
    return openbabelJNI.OBAtom_CountRingBonds(swigCPtr, this);
  }

  public double SmallestBondAngle() {
    return openbabelJNI.OBAtom_SmallestBondAngle(swigCPtr, this);
  }

  public double AverageBondAngle() {
    return openbabelJNI.OBAtom_AverageBondAngle(swigCPtr, this);
  }

  public long BOSum() {
    return openbabelJNI.OBAtom_BOSum(swigCPtr, this);
  }

  public long KBOSum() {
    return openbabelJNI.OBAtom_KBOSum(swigCPtr, this);
  }

  public boolean HasResidue() {
    return openbabelJNI.OBAtom_HasResidue(swigCPtr, this);
  }

  public boolean IsHydrogen() {
    return openbabelJNI.OBAtom_IsHydrogen(swigCPtr, this);
  }

  public boolean IsCarbon() {
    return openbabelJNI.OBAtom_IsCarbon(swigCPtr, this);
  }

  public boolean IsNitrogen() {
    return openbabelJNI.OBAtom_IsNitrogen(swigCPtr, this);
  }

  public boolean IsOxygen() {
    return openbabelJNI.OBAtom_IsOxygen(swigCPtr, this);
  }

  public boolean IsSulfur() {
    return openbabelJNI.OBAtom_IsSulfur(swigCPtr, this);
  }

  public boolean IsPhosphorus() {
    return openbabelJNI.OBAtom_IsPhosphorus(swigCPtr, this);
  }

  public boolean IsAromatic() {
    return openbabelJNI.OBAtom_IsAromatic(swigCPtr, this);
  }

  public boolean IsInRing() {
    return openbabelJNI.OBAtom_IsInRing(swigCPtr, this);
  }

  public boolean IsInRingSize(int arg0) {
    return openbabelJNI.OBAtom_IsInRingSize(swigCPtr, this, arg0);
  }

  public boolean IsHeteroatom() {
    return openbabelJNI.OBAtom_IsHeteroatom(swigCPtr, this);
  }

  public boolean IsNotCorH() {
    return openbabelJNI.OBAtom_IsNotCorH(swigCPtr, this);
  }

  public boolean IsConnected(OBAtom arg0) {
    return openbabelJNI.OBAtom_IsConnected(swigCPtr, this, OBAtom.getCPtr(arg0), arg0);
  }

  public boolean IsOneThree(OBAtom arg0) {
    return openbabelJNI.OBAtom_IsOneThree(swigCPtr, this, OBAtom.getCPtr(arg0), arg0);
  }

  public boolean IsOneFour(OBAtom arg0) {
    return openbabelJNI.OBAtom_IsOneFour(swigCPtr, this, OBAtom.getCPtr(arg0), arg0);
  }

  public boolean IsCarboxylOxygen() {
    return openbabelJNI.OBAtom_IsCarboxylOxygen(swigCPtr, this);
  }

  public boolean IsPhosphateOxygen() {
    return openbabelJNI.OBAtom_IsPhosphateOxygen(swigCPtr, this);
  }

  public boolean IsSulfateOxygen() {
    return openbabelJNI.OBAtom_IsSulfateOxygen(swigCPtr, this);
  }

  public boolean IsNitroOxygen() {
    return openbabelJNI.OBAtom_IsNitroOxygen(swigCPtr, this);
  }

  public boolean IsAmideNitrogen() {
    return openbabelJNI.OBAtom_IsAmideNitrogen(swigCPtr, this);
  }

  public boolean IsPolarHydrogen() {
    return openbabelJNI.OBAtom_IsPolarHydrogen(swigCPtr, this);
  }

  public boolean IsNonPolarHydrogen() {
    return openbabelJNI.OBAtom_IsNonPolarHydrogen(swigCPtr, this);
  }

  public boolean IsAromaticNOxide() {
    return openbabelJNI.OBAtom_IsAromaticNOxide(swigCPtr, this);
  }

  public boolean IsChiral() {
    return openbabelJNI.OBAtom_IsChiral(swigCPtr, this);
  }

  public boolean IsAxial() {
    return openbabelJNI.OBAtom_IsAxial(swigCPtr, this);
  }

  public boolean IsClockwise() {
    return openbabelJNI.OBAtom_IsClockwise(swigCPtr, this);
  }

  public boolean IsAntiClockwise() {
    return openbabelJNI.OBAtom_IsAntiClockwise(swigCPtr, this);
  }

  public boolean IsPositiveStereo() {
    return openbabelJNI.OBAtom_IsPositiveStereo(swigCPtr, this);
  }

  public boolean IsNegativeStereo() {
    return openbabelJNI.OBAtom_IsNegativeStereo(swigCPtr, this);
  }

  public boolean HasChiralitySpecified() {
    return openbabelJNI.OBAtom_HasChiralitySpecified(swigCPtr, this);
  }

  public boolean HasChiralVolume() {
    return openbabelJNI.OBAtom_HasChiralVolume(swigCPtr, this);
  }

  public boolean IsHbondAcceptor() {
    return openbabelJNI.OBAtom_IsHbondAcceptor(swigCPtr, this);
  }

  public boolean IsHbondDonor() {
    return openbabelJNI.OBAtom_IsHbondDonor(swigCPtr, this);
  }

  public boolean IsHbondDonorH() {
    return openbabelJNI.OBAtom_IsHbondDonorH(swigCPtr, this);
  }

  public boolean HasAlphaBetaUnsat(boolean includePandS) {
    return openbabelJNI.OBAtom_HasAlphaBetaUnsat__SWIG_0(swigCPtr, this, includePandS);
  }

  public boolean HasAlphaBetaUnsat() {
    return openbabelJNI.OBAtom_HasAlphaBetaUnsat__SWIG_1(swigCPtr, this);
  }

  public boolean HasBondOfOrder(long bo) {
    return openbabelJNI.OBAtom_HasBondOfOrder(swigCPtr, this, bo);
  }

  public int CountBondsOfOrder(long bo) {
    return openbabelJNI.OBAtom_CountBondsOfOrder(swigCPtr, this, bo);
  }

  public boolean HasNonSingleBond() {
    return openbabelJNI.OBAtom_HasNonSingleBond(swigCPtr, this);
  }

  public boolean HasSingleBond() {
    return openbabelJNI.OBAtom_HasSingleBond(swigCPtr, this);
  }

  public boolean HasDoubleBond() {
    return openbabelJNI.OBAtom_HasDoubleBond(swigCPtr, this);
  }

  public boolean HasAromaticBond() {
    return openbabelJNI.OBAtom_HasAromaticBond(swigCPtr, this);
  }

  public boolean MatchesSMARTS(String arg0) {
    return openbabelJNI.OBAtom_MatchesSMARTS(swigCPtr, this, arg0);
  }

}
