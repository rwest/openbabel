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

  public static OBFingerprint FindFingerprint(String ID) {
    long cPtr = openbabelJNI.OBFingerprint_FindFingerprint(ID);
    return (cPtr == 0) ? null : new OBFingerprint(cPtr, false);
  }

  public OBFingerprint() {
    this(openbabelJNI.new_OBFingerprint(), true);
  }

}
