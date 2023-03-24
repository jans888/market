
export const addType =(data)=>(dispatch)=>{
    dispatch({ type: "TYPE", payload: data });
}
export const addColor =(data)=>(dispatch)=>{
    dispatch({ type: "COLOR", payload: data });
}
export const addSize =(data)=>(dispatch)=>{
    dispatch({ type: "SIZE", payload: data });
}
export const addQuantity =(data)=>(dispatch)=>{
    dispatch({ type: "QUANTITY", payload: data });
}
