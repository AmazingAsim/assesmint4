const express =require('express')
const app=express();
const Port=process.env.Port || 3006;

app.use(express.static('./dist/client'));

app.listen(Port,()=>{
    console.log('angular tutorial on port'+Port);
})

// some
console.log('bla')