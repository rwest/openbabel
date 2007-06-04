/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.31
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public class FptIndex {
  private long swigCPtr;
  protected boolean swigCMemOwn;

  protected FptIndex(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(FptIndex obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if(swigCPtr != 0 && swigCMemOwn) {
      swigCMemOwn = false;
      openbabelJNI.delete_FptIndex(swigCPtr);
    }
    swigCPtr = 0;
  }

  public void setHeader(FptIndexHeader value) {
    openbabelJNI.FptIndex_header_set(swigCPtr, this, FptIndexHeader.getCPtr(value), value);
  }

  public FptIndexHeader getHeader() {
    return new FptIndexHeader(openbabelJNI.FptIndex_header_get(swigCPtr, this), false);
  }

  public void setFptdata(vectorUnsignedInt value) {
    openbabelJNI.FptIndex_fptdata_set(swigCPtr, this, vectorUnsignedInt.getCPtr(value), value);
  }

  public vectorUnsignedInt getFptdata() {
    return new vectorUnsignedInt(openbabelJNI.FptIndex_fptdata_get(swigCPtr, this), false);
  }

  public void setSeekdata(vectorUnsignedInt value) {
    openbabelJNI.FptIndex_seekdata_set(swigCPtr, this, vectorUnsignedInt.getCPtr(value), value);
  }

  public vectorUnsignedInt getSeekdata() {
    return new vectorUnsignedInt(openbabelJNI.FptIndex_seekdata_get(swigCPtr, this), false);
  }

  public boolean Read(SWIGTYPE_p_std__istream pIndexstream) {
    return openbabelJNI.FptIndex_Read(swigCPtr, this, SWIGTYPE_p_std__istream.getCPtr(pIndexstream));
  }

  public OBFingerprint CheckFP() {
    long cPtr = openbabelJNI.FptIndex_CheckFP(swigCPtr, this);
    return (cPtr == 0) ? null : new OBFingerprint(cPtr, false);
  }

  public FptIndex() {
    this(openbabelJNI.new_FptIndex(), true);
  }

}