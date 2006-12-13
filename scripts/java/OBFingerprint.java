/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.31
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public class OBFingerprint {
  private long swigCPtr;
  protected boolean swigCMemOwn;

  protected OBFingerprint(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(OBFingerprint obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if(swigCPtr != 0 && swigCMemOwn) {
      swigCMemOwn = false;
      openbabelJNI.delete_OBFingerprint(swigCPtr);
    }
    swigCPtr = 0;
  }

  public void SetBit(vectorUnsignedInt vec, long n) {
    openbabelJNI.OBFingerprint_SetBit(swigCPtr, this, vectorUnsignedInt.getCPtr(vec), vec, n);
  }

  public void Fold(vectorUnsignedInt vec, long nbits) {
    openbabelJNI.OBFingerprint_Fold(swigCPtr, this, vectorUnsignedInt.getCPtr(vec), vec, nbits);
  }

  public boolean GetFingerprint(OBBase pOb, vectorUnsignedInt fp, int nbits) {
    return openbabelJNI.OBFingerprint_GetFingerprint__SWIG_0(swigCPtr, this, OBBase.getCPtr(pOb), pOb, vectorUnsignedInt.getCPtr(fp), fp, nbits);
  }

  public boolean GetFingerprint(OBBase pOb, vectorUnsignedInt fp) {
    return openbabelJNI.OBFingerprint_GetFingerprint__SWIG_1(swigCPtr, this, OBBase.getCPtr(pOb), pOb, vectorUnsignedInt.getCPtr(fp), fp);
  }

  public String Description() {
    return openbabelJNI.OBFingerprint_Description(swigCPtr, this);
  }

  public long Flags() {
    return openbabelJNI.OBFingerprint_Flags(swigCPtr, this);
  }

  public static boolean GetNextFPrt(SWIGTYPE_p_std__string id, OBFingerprint pFPrt) {
    return openbabelJNI.OBFingerprint_GetNextFPrt(SWIGTYPE_p_std__string.getCPtr(id), OBFingerprint.getCPtr(pFPrt));
  }

  public static OBFingerprint FindFingerprint(SWIGTYPE_p_std__string ID) {
    long cPtr = openbabelJNI.OBFingerprint_FindFingerprint(SWIGTYPE_p_std__string.getCPtr(ID));
    return (cPtr == 0) ? null : new OBFingerprint(cPtr, false);
  }

  public static double Tanimoto(vectorUnsignedInt vec1, vectorUnsignedInt vec2) {
    return openbabelJNI.OBFingerprint_Tanimoto__SWIG_0(vectorUnsignedInt.getCPtr(vec1), vec1, vectorUnsignedInt.getCPtr(vec2), vec2);
  }

  public static double Tanimoto(vectorUnsignedInt vec1, SWIGTYPE_p_unsigned_int p2) {
    return openbabelJNI.OBFingerprint_Tanimoto__SWIG_1(vectorUnsignedInt.getCPtr(vec1), vec1, SWIGTYPE_p_unsigned_int.getCPtr(p2));
  }

  public static long Getbitsperint() {
    return openbabelJNI.OBFingerprint_Getbitsperint();
  }

  public final static class FptFlag {
    public final static FptFlag FPT_UNIQUEBITS = new FptFlag("FPT_UNIQUEBITS", openbabelJNI.OBFingerprint_FPT_UNIQUEBITS_get());

    public final int swigValue() {
      return swigValue;
    }

    public String toString() {
      return swigName;
    }

    public static FptFlag swigToEnum(int swigValue) {
      if (swigValue < swigValues.length && swigValue >= 0 && swigValues[swigValue].swigValue == swigValue)
        return swigValues[swigValue];
      for (int i = 0; i < swigValues.length; i++)
        if (swigValues[i].swigValue == swigValue)
          return swigValues[i];
      throw new IllegalArgumentException("No enum " + FptFlag.class + " with value " + swigValue);
    }

    private FptFlag(String swigName) {
      this.swigName = swigName;
      this.swigValue = swigNext++;
    }

    private FptFlag(String swigName, int swigValue) {
      this.swigName = swigName;
      this.swigValue = swigValue;
      swigNext = swigValue+1;
    }

    private FptFlag(String swigName, FptFlag swigEnum) {
      this.swigName = swigName;
      this.swigValue = swigEnum.swigValue;
      swigNext = this.swigValue+1;
    }

    private static FptFlag[] swigValues = { FPT_UNIQUEBITS };
    private static int swigNext = 0;
    private final int swigValue;
    private final String swigName;
  }

}
