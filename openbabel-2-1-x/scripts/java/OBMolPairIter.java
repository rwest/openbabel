/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.31
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public class OBMolPairIter {
  private long swigCPtr;
  protected boolean swigCMemOwn;

  protected OBMolPairIter(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(OBMolPairIter obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if(swigCPtr != 0 && swigCMemOwn) {
      swigCMemOwn = false;
      openbabelJNI.delete_OBMolPairIter(swigCPtr);
    }
    swigCPtr = 0;
  }

  public OBMolPairIter() {
    this(openbabelJNI.new_OBMolPairIter__SWIG_0(), true);
  }

  public OBMolPairIter(OBMol mol) {
    this(openbabelJNI.new_OBMolPairIter__SWIG_1(OBMol.getCPtr(mol), mol), true);
  }

  public OBMolPairIter(OBMolPairIter ai) {
    this(openbabelJNI.new_OBMolPairIter__SWIG_2(OBMolPairIter.getCPtr(ai), ai), true);
  }

  public vectorUnsignedInt __ref__() {
    return new vectorUnsignedInt(openbabelJNI.OBMolPairIter___ref__(swigCPtr, this), true);
  }

}
