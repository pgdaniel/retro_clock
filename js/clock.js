// Generated by CoffeeScript 1.6.3
(function(){var e;e=function(t){t(function(){return e.initialize()});console.log("Tick-TOCK");return{$minutesOnes:null,$minutesTens:null,$hoursTens:null,$hoursOnes:null,initialize:function(){var e;this.time=[0,0,0,0];this.$minutesOnes=t(".minutes-ones");this.$minutesTens=t(".minutes-tens");this.$hoursOnes=t(".hours-ones");this.$hoursTens=t(".hours-tens");e=new Date;this._populateMinutes(e.getMinutes());this._populateHours(e.getHours());return this._populateDigits()},_populateMinutes:function(e){var t,n;t=e.toString();return t.length===1?this.time[3]=t:(n=[t[0],t[1]],this.time[2]=n[0],this.time[3]=n[1],n)},_populateHours:function(e){var t,n,r;t=e.toString();t.length===1&&(this.time[1]=t);e===0&&(n=["1","2"],this.time[0]=n[0],this.time[1]=n[1]);if(e>12){t=(e-12).toString();return t.length===1?this.time[3]=t:(r=[minutesString[0],minutesString[1]],this.time[0]=r[0],this.time[1]=r[1],r)}},_populateDigits:function(){this.$minutesOnes.text(this.time[3]);this.$minutesTens.text(this.time[2]);this.$hoursOnes.text(this.time[1]);return this.$hoursTens.text(this.time[0])}}}($);jQuery}).call(this);