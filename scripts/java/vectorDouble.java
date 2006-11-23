/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.30
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public class vectorDouble {
  private long swigCPtr;
  protected boolean swigCMemOwn;

  protected vectorDouble(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(vectorDouble obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if(swigCPtr != 0 && swigCMemOwn) {
      swigCMemOwn = false;
      openbabelJNI.delete_vectorDouble(swigCPtr);
    }
    swigCPtr = 0;
  }

  public vectorDouble() {
    this(openbabelJNI.new_vectorDouble__SWIG_0(), true);
  }

  public vectorDouble(long n) {
    this(openbabelJNI.new_vectorDouble__SWIG_1(n), true);
  }

  public long size() {
    return openbabelJNI.vectorDouble_size(swigCPtr, this);
  }

  public long capacity() {
    return openbabelJNI.vectorDouble_capacity(swigCPtr, this);
  }

  public void reserve(long n) {
    openbabelJNI.vectorDouble_reserve(swigCPtr, this, n);
  }

  public boolean isEmpty() {
    return openbabelJNI.vectorDouble_isEmpty(swigCPtr, this);
  }

  public void clear() {
    openbabelJNI.vectorDouble_clear(swigCPtr, this);
  }

  public void add(double x) {
    openbabelJNI.vectorDouble_add(swigCPtr, this, x);
  }

  public double get(int i) {
    return openbabelJNI.vectorDouble_get(swigCPtr, this, i);
  }

  public void set(int i, double x) {
    openbabelJNI.vectorDouble_set(swigCPtr, this, i, x);
  }

}